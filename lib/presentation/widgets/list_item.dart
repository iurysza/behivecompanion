import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pictureUrl;
  final Function onActionClick;
  final Function onTap;

  ListItem({
    Key key,
    this.title,
    this.subtitle,
    this.pictureUrl,
    this.onActionClick,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pictureKey = Key("pictureKey");
    var fadeInImage;

    if (pictureUrl == null) {
      fadeInImage = Image.asset(
        'assets/images/placeholder.png',
        key: pictureKey,
      );
    } else {
      fadeInImage = FadeInImage.assetNetwork(
        fit: BoxFit.cover,
        width: 50,
        key: pictureKey,
        height: 50,
        placeholder: 'assets/images/placeholder.png',
        image: pictureUrl,
      );
    }
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipOval(
                    child: fadeInImage,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
