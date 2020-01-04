import 'package:andreas/constants.dart';
import 'package:andreas/views/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: primaryColor,
          secondaryHeaderColor: secondaryColor,
        ),
        home: Login());
  }
}
