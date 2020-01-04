import 'package:flutter/material.dart';

MaterialColor _createColor(Color color) {
  final int r = color.red;
  final int g = color.green;
  final int b = color.blue;
  final map = Map.fromEntries(
      [50, 100, 200, 300, 400, 500, 600, 700, 800, 900].map((i) {
    final int multiplier = (i / 500).round();
    return MapEntry(
        i,
        Color.fromARGB(
          0xFF,
          r * multiplier,
          g * multiplier,
          b * multiplier,
        ));
  }));
  return MaterialColor(color.value, map);
}

const appName = "Andreas";
final primaryColor = _createColor(Color(0xFF4DC689));
final secondaryColor = _createColor(Color(0xFF16543A));
