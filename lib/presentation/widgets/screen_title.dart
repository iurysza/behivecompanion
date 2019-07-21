import 'package:flutter/material.dart';

class ScreenHeaderWidget extends StatelessWidget {
  const ScreenHeaderWidget({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.display1,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ],
    );
  }
}
