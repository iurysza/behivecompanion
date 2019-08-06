import 'dart:math';

import 'package:behivecompanion/helper/custom_icons.dart';
import 'package:flutter/material.dart';

class CarouselFooterItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    var nextInt = Random().nextInt(2);
    var isLocked = nextInt == 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              GroupIcon(isLocked ? Icons.lock : Icons.lock_open),
              GroupIcon(MyFlutterApp.hash),
              GroupIcon(Icons.group)
            ],
          )),
          FlatButton(
              shape: StadiumBorder(side: BorderSide(color: Colors.orange)),
              padding: EdgeInsets.all(8),
              onPressed: () => print(" click"),
              child: Text(
                "Join",
                style: style.body2.copyWith(color: Colors.black),
              )),
        ],
      ),
    );
  }
}

class GroupIcon extends StatelessWidget {
  final IconData icon;

  GroupIcon(
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        icon,
        size: 16,
      ),
    );
  }
}
