import 'package:behivecompanion/helper/color.dart';
import 'package:behivecompanion/presentation/features/discovery/indicator.dart';
import 'package:behivecompanion/presentation/features/discovery/most_popular_groups_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "# Discover",
              style: style.display1,
            ),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            unselectedLabelColor: HexColor("#A2ACB0"),
            labelColor: HexColor("#302740"),
            indicator: MD2Indicator(
                indicatorHeight: 12,
                indicatorColor: Colors.blue,
                indicatorSize: MD2IndicatorSize.tiny),
            tabs: <Widget>[
              Tab(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Bombando",
                    ),
                  ),
                ),
              ),
              Tab(
                  child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Perto de você"),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
              )),
              Tab(
                  child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    "Categorias",
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )),
            ],
          ),
        ),
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.down,
          children: <Widget>[
            MostPopularTab(),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  "Second",
                  style: style.body1,
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text(
                  "Third",
                  style: style.body1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
