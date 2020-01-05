import 'package:andreas/views/elements.dart';
import 'package:andreas/views/hub.dart';
import 'package:andreas/views/scaffold.dart';
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
  Widget build(BuildContext context) => scaffold(
        Column(
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
                    () => _handleForgotPassword(emailController.text)),
                mainButton(
                    "Inloggen",
                    () async => _handleLogin(context, emailController.text,
                        passwordController.text)),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                button(
                  "Nieuw account...",
                  () => _handleCreateAccount(
                      emailController.text, passwordController.text),
                ),
              ],
            )
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

void _handleCreateAccount(String email, String password) =>
    _auth.createUserWithEmailAndPassword(email: email, password: password);

void _handleForgotPassword(String email) =>
    _auth.sendPasswordResetEmail(email: email);

void _handleLogin(BuildContext context, String email, String password) async {
  // TODO add wrong email/password notification
  final FirebaseUser user =
      (await _auth.signInWithEmailAndPassword(email: email, password: password))
          .user;
  if (user != null) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Hub(user)));
  }
}
