import 'package:behivecompanion/data/services/services_controller.dart';
import 'package:behivecompanion/di/provider_setup.dart';
import 'package:behivecompanion/di/service_locator.dart';
import 'package:behivecompanion/presentation/base/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  final serviceLocator = injectDependencies();
  final initialScreen = await Router.getInitialRoute(serviceLocator<ServicesController>());

  runApp(MyApp(initialScreen));
}

class MyApp extends StatelessWidget {
  final initialScreen;

  MyApp(this.initialScreen);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Behive Companion',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: initialScreen,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

//class MyHomePage extends StatelessWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  Widget build(BuildContext context) {
//    var provider = Provider.of<LoginVM>(context);
//    return Consumer<LoginVM>(
//      builder: (context, listModel, _) => Scaffold(
//            appBar: AppBar(title: Text(this.title)),
//            body: LoginView(), // This trailing comma makes auto-formatting nicer for build methods.
//          ),
//    );
//  }
//}
