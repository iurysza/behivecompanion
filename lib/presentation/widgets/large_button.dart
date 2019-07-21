import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const LargeButton({
    Key key,
    this.text,
    this.color = Colors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color,
        height: 60,
        textTheme: ButtonTextTheme.normal,
        shape: StadiumBorder(side: BorderSide.none),
        onPressed: onPressed,
        child: new Text(
          text,
          style: Theme.of(context).textTheme.display1.copyWith(fontSize: 24.0),
        ));
  }
}
