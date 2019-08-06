import 'package:flutter/material.dart';

class CarouselHeaderItem extends StatelessWidget {
  final String picture;
  final String title;

  CarouselHeaderItem(
    this.title,
    this.picture,
  );

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Stack(
          children: <Widget>[
            FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholder: 'assets/images/placeholder.png',
              image: picture,
            ),
            Container(
              height: double.infinity,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -.1),
                  end: Alignment(0, 1),
                  colors: [Colors.white10, Colors.white],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
              child: Text(
                title,
                style: style.body2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
