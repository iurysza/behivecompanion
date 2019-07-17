import 'package:behivecompanion/data/ParseController.dart';
import 'package:behivecompanion/di/service_locator.dart';
import 'package:behivecompanion/presentation/HiveListModel.dart';
import 'package:behivecompanion/presentation/Login.dart';
import 'package:behivecompanion/presentation/LoginVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  var parseController = serviceLocator<ParseController>();
  parseController.initializeParse().then(( data) {
    print("Parse initialization: $data");
  }).catchError((error) {
    print("ERROR ");

  });


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'asdasdasd ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          builder: (context) => LoginVM(),
          child: MyHomePage(title: 'Companion')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginVM>(context);
    return Consumer<LoginVM>(
      builder: (context, listModel, _) => Scaffold(
            appBar: AppBar(title: Text(this.title)),
            body: LoginView(), // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
