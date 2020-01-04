import 'package:andreas/constants.dart';
import 'package:flutter/material.dart';

button(String text) => OutlineButton(
      child: Text(
        text,
        style: TextStyle(
          color: secondaryColor,
        ),
      ),
      onPressed: () {},
      color: primaryColor,
      shape: StadiumBorder(),
    );

mainButton(String text) => RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: secondaryColor,
        ),
      ),
      onPressed: () {},
      color: primaryColor,
      shape: StadiumBorder(),
    );
