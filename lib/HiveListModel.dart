import 'package:behivecompanion/HiveList.dart';
import 'package:flutter/material.dart';

class HiveListModel extends ChangeNotifier {
  List<HiveItem> itemList = [];

  void initList() {
    itemList = HiveItem.createFakeHives();
    notifyListeners();
  }

  HiveItem getItemAt(int pos) {
    return itemList[pos];

  }

  addItem() {
    itemList.add(HiveItem(name: "NewItem", lastEvent: "New envent",eventTime: "Just added"));
    notifyListeners();
  }
}
