import 'package:andreas/constants.dart';
import 'package:flutter/material.dart';

button(String text, VoidCallback onPressed) => OutlineButton(
      child: Text(
        text,
        style: TextStyle(
          color: secondaryColor,
        ),
      ),
      onPressed: onPressed,
      color: primaryColor,
      shape: StadiumBorder(),
    );

mainButton(String text, VoidCallback onPressed) => RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: secondaryColor,
        ),
      ),
      onPressed: onPressed,
      color: primaryColor,
      shape: StadiumBorder(),
    );

showSnackbar(BuildContext context, String text) =>
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
