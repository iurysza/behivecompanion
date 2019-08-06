import 'package:behivecompanion/helper/color.dart';
import 'package:charts_common/common.dart' as charts;
import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData getDefaultAppTheme(BuildContext context) {
    final ThemeData base = ThemeData.light();
    final bhBlue = HexColor("#2484BA");
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
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
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

class BHColor {
  static final chartPink = HexColor("#FF6D76");
  static final chartBlue = HexColor("#83D2FF");
  static final chartGreen = HexColor("#B3E3E1");
  static final chartYellow = HexColor("#FFC40A");

  static final chartPalette = [chartPink, chartBlue, chartGreen, chartYellow];

  static Color getPiePalette(int index) {
    var position;
    if (index < 0) {
      position = (index % chartPalette.length + chartPalette.length) % chartPalette.length;
    } else {
      position = index % chartPalette.length;
    }
    return chartPalette[position];
  }

  static charts.Color getChartPalette(int index) {
    return asChartColor(getPiePalette(index));
  }

  static charts.Color asChartColor(Color color) {
    return charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);
  }
}
