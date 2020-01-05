import 'package:andreas/views/scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hub extends StatefulWidget {
  final FirebaseUser user;

  Hub(this.user);

  @override
  _HubState createState() => _HubState(user);
}

class _HubState extends State<Hub> {
  final FirebaseUser user;

  _HubState(this.user);

  @override
  Widget build(BuildContext context) => scaffold(
        Column(
          children: <Widget>[
            Text(user.email),
            Text("Mijn volgende stap is om rollen toe te kunnen kennen aan "
                "gebruikers, denk hierbij aan het toekennen van de rollen: \n"
                " - Ik ben leiding bij de Batavieren\n"
                " - Ik ben lid bij de WGA\n"
                " - Mijn kind is lid bij de Clemens."),
            Text("Wil je meedenken over de toekomst van deze app, "
                "stuur Ivo dan een berichtje of spreek hem aan!")
          ],
        ),
      );
}
