import 'package:behivecompanion/presentation/HiveList.dart';
import 'package:behivecompanion/presentation/HiveListModel.dart';
import 'package:behivecompanion/data/ParseController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  var parseController = ParseController();
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
          builder: (context) => HiveListModel(),
          child: MyHomePage(title: 'Companion')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HiveListModel>(context);
    return Consumer<HiveListModel>(
      builder: (context, listModel, _) => Scaffold(
            appBar: AppBar(title: Text(this.title)),
            body: HiveList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.addItem();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
