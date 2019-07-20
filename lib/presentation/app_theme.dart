import 'package:behivecompanion/helper/color.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData getDefaultAppTheme(BuildContext context) {
    final ThemeData base = ThemeData.light();
    final bhBlue = HexColor("#FFFEDBD0");
    final bhPink = HexColor("#EB246F");
    const surfaceWhite = const Color(0xFFFFFBFA);
    const backgroundWhite = Colors.white;
    const error = const Color(0xFFC5032B);

    return base.copyWith(
        accentColor: bhPink,
        primaryColor: bhBlue,
        buttonTheme: base.buttonTheme.copyWith(
          buttonColor: bhBlue,
          textTheme: ButtonTextTheme.normal,
        ),
        scaffoldBackgroundColor: backgroundWhite,
        cardColor: surfaceWhite,
        textSelectionColor: bhBlue,
        errorColor: error,
        textTheme: TextTheme(
          display1: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold, color: Colors.black87),
          headline: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black45),
          subhead: TextStyle(fontSize: 16.0, color: Colors.black87),
          body2: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal, color: Colors.black87),
          body1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black54),
          overline: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black38),
        ));
  }
}
