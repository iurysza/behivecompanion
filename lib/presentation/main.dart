import 'package:behivecompanion/data/services/services_controller.dart';
import 'package:behivecompanion/di/provider_setup.dart';
import 'package:behivecompanion/di/service_locator.dart';
import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:behivecompanion/presentation/base/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  Provider.debugCheckInvalidValueType = null;
  await ServiceContainer().injectDependencies().get<ServicesController>().initParse();

  runApp(MyApp(RoutePaths.HiveList));
}

class MyApp extends StatelessWidget {
  final initialScreen;

  MyApp(this.initialScreen);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: mockedServices,
      child: MaterialApp(
        title: 'Behive Companion',
        theme: ThemeUtils.getDefaultAppTheme(context),
        initialRoute: initialScreen,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
