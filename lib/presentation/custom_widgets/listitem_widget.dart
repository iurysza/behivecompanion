import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pictureUrl;
  final Function onActionClick;
  final Function onItemClick;

  ListItemWidget({
    Key key,
    this.title,
    this.subtitle,
    this.pictureUrl,
    this.onActionClick,
    this.onItemClick,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClick();
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      placeholder: 'assets/images/placeholder.png',
                      image: pictureUrl,
                    ),
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
          Divider(color: Colors.black,
          ),
        ],
      ),
    );
  }
}
