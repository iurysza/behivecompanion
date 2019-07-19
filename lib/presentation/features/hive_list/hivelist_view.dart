import 'package:behivecompanion/data/repositories/hives/hive_repositoryimpl.dart';
import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/features/hive_list/hivelist_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HiveListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hive List')),
        body: Container(
          child: BaseWidget<HiveListVM>(
            onModelReady: (viewModel) => viewModel.getHiveList(),
            model: HiveListVM(hiveRepository: Provider.of<HiveRepositoryImpl>(context)),
            builder: (context, listModel, child) {
              return ListView.builder(
                itemCount: listModel.itemList.length,
                itemBuilder: (context, position) {
                  return InkWell(
                    onTap: () {
                      print("Card Clicked");
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      listModel.getItemAt(position).name,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.red[500],
                                    ),
                                    Text('41'),
                                  ]),
                            ],
                          ),
                        ),
                            Divider(
                              height: 2.0,
                              color: Colors.black,
                            ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class HiveItem {
  String name;
  String lastEvent;
  String eventTime;
  DateTime date;

  HiveItem({this.name, this.lastEvent, String eventTime}) {
    this.eventTime = eventTime ??
        DateFormat(
          "d 'de' MMMM",
        ).format(DateTime.now());
  }

  static List<HiveItem> createFakeHives({int size = 10}) {
    return List.generate(size, (int index) {
      return HiveItem(name: "Item $index", lastEvent: "An Event");
    });
  }
}
