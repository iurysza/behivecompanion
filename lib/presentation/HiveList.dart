import 'package:behivecompanion/presentation/HiveListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HiveList extends StatelessWidget {
//  HiveList(this.hiveList);

  @override
  Widget build(BuildContext context) {
    return Consumer<HiveListModel>(
      builder: (context, listModel, _) => ListView.builder(
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                            child: Text(
                              listModel.getItemAt(position).name,
                              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                            child: Text(
                              listModel.getItemAt(position).lastEvent,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              listModel.getItemAt(position).eventTime,
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.star_border,
                                size: 35.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey,
                  )
                ],
              );
            },
            itemCount: listModel.itemList.length,
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
