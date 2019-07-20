import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData getDefaultAppTheme(BuildContext context) {
    return ThemeData(
        // Define the default brightness and colors.
        primaryColor: Colors.lightBlue,
        brightness: Brightness.light,
        accentColor: Colors.pinkAccent,
        textTheme: TextTheme(
          display1: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold, color: Colors.black87),
          headline: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black45 ),
          subhead: TextStyle(fontSize: 16.0, color: Colors.black87),
          body2: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal, color: Colors.black87),
          body1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black54),
          overline: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black38),
        ));
  }
}
