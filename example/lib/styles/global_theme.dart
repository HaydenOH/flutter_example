import 'package:flutter/material.dart';

class GlobalTheme {
  static final ThemeData lightTheme = ThemeData(
      fontFamily: "text",
      scaffoldBackgroundColor: Colors.white,
      // colorScheme: ColorScheme.light(),
      brightness: Brightness.light,
      primaryColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.red,
        disabledColor: Colors.red,
      ));

  static final ThemeData darkTheme = ThemeData(
      fontFamily: "text",
      scaffoldBackgroundColor: Color(0xff18171D),
      brightness: Brightness.dark,
      primaryColor: Color(0xff18171d),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        // disabledColor: Colors.grey,
      ));
}
