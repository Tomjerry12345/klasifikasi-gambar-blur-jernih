import 'package:flutter/material.dart';

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.value, shades);
}

MaterialColor primaryColor = getMaterialColor(const Color.fromRGBO(118, 151, 1, 1));
MaterialColor backgroundAutentikasiColor = getMaterialColor(const Color.fromRGBO(167, 168, 164, 1));
MaterialColor btnColor = getMaterialColor(const Color.fromRGBO(0, 0, 0, 1));
MaterialColor secondaryColor = getMaterialColor(const Color.fromRGBO(118, 151, 1, 0.3));
MaterialColor linkColor = getMaterialColor(const Color.fromRGBO(21, 103, 146, 1));
