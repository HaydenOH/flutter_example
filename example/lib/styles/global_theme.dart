import 'package:flutter/material.dart';

class GlobalTheme {
  static ThemeData lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      // scaffoldBackgroundColor: Colors.white,
      // primarySwatch:Color(0xFFFFFFFF),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));

  static ThemeData darkTheme = ThemeData(
      accentColor: Colors.red,
      // scaffoldBackgroundColor: Color(0xff18171d),
      brightness: Brightness.dark,
      primaryColor: Color(0xff18171d),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));
}
