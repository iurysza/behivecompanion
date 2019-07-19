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
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: BaseWidget<HiveListVM>(
          onModelReady: (viewModel)=> viewModel.getHiveList(),
          model: HiveListVM(hiveRepository: Provider.of<HiveRepositoryImpl>(context)),
          builder: (context, listModel, child) {
            return ListView.builder(
              itemBuilder: (context, position) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        listModel.getItemAt(position).name,
                        style: TextStyle(
                            fontFamily: 'Montserrat', color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.blue,
                    ),
                  ],
                );
              },
              itemCount: listModel.itemList.length,
            );
          },
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
