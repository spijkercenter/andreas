import 'package:andreas/views/elements.dart';
import 'package:andreas/views/scaffold.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) => scaffold(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'wachtwoord',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                button("Wachtwoord vergeten"),
                mainButton("Inloggen"),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                button("Nieuw account..."),
              ],
            )
          ],
        ),
      );
}
