import 'package:behivecompanion/data/services/services_controller.dart';
import 'package:behivecompanion/presentation/features/hive_list/hivelist_view.dart';
import 'package:behivecompanion/presentation/features/login/login_view.dart';
import 'package:behivecompanion/presentation/features/onboarding/onboarding_view.dart';
import 'package:behivecompanion/presentation/features/statistics/statistics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Future<String> getInitialRoute(Function isLoggedIn) async {
    try {
      if (await isLoggedIn()) {
        return RoutePaths.HiveList;
      } else {
        return RoutePaths.Login;
      }
    } catch (e) {
      return RoutePaths.Login;
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
//    SystemUI.setDefaultStatusBar();
    switch (settings.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.Onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case RoutePaths.Statistics:
        return MaterialPageRoute(builder: (_) => StatisticsView(settings.arguments as String));
      case RoutePaths.HiveList:
        return MaterialPageRoute(builder: (_) => HiveListView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class RoutePaths {
  static const String Login = 'login';
  static const String Onboarding = 'onboarding';
  static const String HiveList = 'hivelist';
  static const String Statistics = 'statistics';
}
