import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData getDefaultAppTheme() {
    return ThemeData(
        // Define the default brightness and colors.
        primaryColor: Colors.lightBlue,
        brightness: Brightness.light,
        accentColor: Colors.pinkAccent,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 29.0, fontWeight: FontWeight.bold, color: Colors.black87),
          title: TextStyle(fontSize: 16.0, color: Colors.black87),
          body1: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal, color: Colors.black87),
          body2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black54),
          subhead: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black38),
        ));
  }
}
