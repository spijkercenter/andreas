import 'package:andreas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _contentSize = 48.0;

Scaffold scaffold(Widget body) {
  return new Scaffold(
    appBar: AppBar(
      title: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/wolf.svg",
            color: secondaryColor,
            height: _contentSize,
          ),
          Text(
            appName,
            style: TextStyle(
              color: secondaryColor,
              fontFamily: "Snorelia",
              fontSize: _contentSize,
            ),
          ),
        ],
      ),
    ),
    body: body,
  );
}
