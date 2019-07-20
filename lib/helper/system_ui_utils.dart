import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUI {
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: color, // status bar color
    ));
  }

  static void setWhiteStatusBar() {
    setStatusBarColor(Colors.white);
  }

  static void setDefaultStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }
}
