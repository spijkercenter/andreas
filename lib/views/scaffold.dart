import 'package:andreas/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Scaffold scaffold(Function(BuildContext) bodyBuilder) {
  return new Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          appName,
          style: TextStyle(
            color: secondaryColor,
            fontFamily: "Snorelia",
            fontSize: 48
          ),
        ),
      ),
    ),
    body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Builder(
          builder: (context) => bodyBuilder(context),
        )),
  );
}
