import 'package:andreas/views/elements.dart';
import 'package:andreas/views/hub.dart';
import 'package:andreas/views/roots.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext _) => scaffold(
        (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'email',
              ),
              controller: emailController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'wachtwoord',
              ),
              controller: passwordController,
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                button("Wachtwoord vergeten",
                    () => _handleForgotPassword(context, emailController.text)),
                mainButton(
                    "Inloggen",
                    () async => _handleLogin(context, emailController.text,
                        passwordController.text)),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                button(
                  "Nieuw account",
                  () => _handleCreateAccount(
                      context, emailController.text, passwordController.text),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                  "Deze applicatie is onder ontwikkeling en nog niet af. "
                  "Er zijn geen garanties op de juistheid of veiligheid van gegevens. "
                  "Hier wordt nog aan gewerkt. "
                  "Vul dus niks in wat een ander niet te weten mag komen. "
                  "Uw gegevens kunnen tijdens het ontwikkelen ook verwijderd of "
                  "anderszins aangepast worden, gebruik dit dus (nog) niet als "
                  "vervanging van uw huidige systeem."
                  "\n\nBen je benieuwd naar hoe dit werkt, kijk naar de code op: "
                  "github.com/spijkercenter/andreas of doe navraag bij de ontwikkelaar."
                  "\n\nInput en terugkoppeling worden gewaardeerd!"),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

bool _require(BuildContext context, String itemName, String item) {
  if (item == null || item.isEmpty) {
    showSnackbar(context, "Voer eerst een " + itemName + " in");
    return false;
  }
  return true;
}

bool _requireEmail(BuildContext context, String email) =>
    _require(context, "emailadres", email);

bool _requirePassword(BuildContext context, String password) =>
    _require(context, "wachtwoord", password);

void _handleCreateAccount(
    BuildContext context, String email, String password) async {
  if (_requireEmail(context, email) && _requirePassword(context, password)) {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    result.user.sendEmailVerification();
    showSnackbar(
        context, "Account aangemaakt, bevestig je email alvorens in te loggen");
  }
}

void _handleForgotPassword(BuildContext context, String email) {
  if (_requireEmail(context, email)) {
    _auth.sendPasswordResetEmail(email: email);
    showSnackbar(context, "Wachtwoordherstel gemaild");
  }
}

void _handleLogin(BuildContext context, String email, String password) async {
  if (_requireEmail(context, email) && _requirePassword(context, password)) {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null && user.isEmailVerified) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Hub(user)));
    } else {
      showSnackbar(
          context,
          "Deze gebruiker is onbekend of nog niet bevestigd\n"
          "Emailbevesting opnieuw sturen?");
    }
  }
}
