import 'package:andreas/views/roots.dart';
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
  Widget build(BuildContext context) => tabView(
        [
          TabElement(
            Icons.supervisor_account,
            (_) => Text(
                "In dit tabblad zul je in de toekomst aan kunnen geven dat je een "
                "OUDER/VERZORGER van een LID of meerdere LEDEN bent. Hiervoor is je "
                "NAAM en per LID hun NAAM en AFDELING vereist."),
          ),
          TabElement(
            Icons.person,
            (_) => Text("In dit tabblad zul je in de toekomst aan kunnen geven "
                "dat je ee (WATER)GIDS of (ZEE)VERKENNER bent. "
                "Hiervoor is je NAAM en AFDELING vereist."),
          ),
          TabElement(
            Icons.security,
            (_) => Column(
              children: <Widget>[
                Text(
                    "In dit tabblad zul je in de toekomst aan kunnen geven dat je een "
                    "VRIJWILLIGER bent. Hiervoor is je NAAM en AFDELING vereist."),
                CircularProgressIndicator()
              ],
            ),
          ),
        ],
      );
}
