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
        Text("You are logged in as " + user.email),
      );
}
