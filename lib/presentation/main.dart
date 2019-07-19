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
            // Define the default brightness and colors.
            primaryColor: Colors.lightBlue,
            accentColor: Colors.pinkAccent,
            textTheme: TextTheme(
              headline: TextStyle(
                  fontSize: 29.0, fontWeight: FontWeight.bold, color: Colors.black87),
              title: TextStyle(fontSize: 16.0, color: Colors.black87),
              body1: TextStyle(
                  fontSize: 16.0, fontStyle: FontStyle.normal, color: Colors.black87),
              body2: TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black54),
              subhead: TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black38),
            )),
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
