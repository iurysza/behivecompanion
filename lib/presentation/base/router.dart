import 'package:behivecompanion/data/services/services_controller.dart';
import 'package:behivecompanion/helper/system_ui_utils.dart';
import 'package:behivecompanion/presentation/features/hive_list/hivelist_view.dart';
import 'package:behivecompanion/presentation/features/login/code_request_view.dart';
import 'package:behivecompanion/presentation/features/login/login_view.dart';
import 'package:behivecompanion/presentation/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Future<String> getInitialRoute(ServicesController serviceController) async {
    try {
      if (await serviceController.parseController.isLoggedIn()) {
        return RoutePaths.Login;
      } else {
        return RoutePaths.HiveList;
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
      case RoutePaths.HiveList:
        return MaterialPageRoute(builder: (_) => HiveListView());
      case RoutePaths.RequestCode:
        return MaterialPageRoute(builder: (_) => CodeRequestView());
        case RoutePaths.Onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingView());
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
  static const String RequestCode = 'request_code';
  static const String Onboarding = 'onboarding';
  static const String HiveList = 'hivelist';
}
