import 'package:behivecompanion/presentation/features/discovery/carousel/carousel_data_item.dart';
import 'package:behivecompanion/presentation/features/discovery/carousel/carousel_footer_item_widget.dart';
import 'package:behivecompanion/presentation/features/discovery/carousel/carousel_item_header_widget.dart';
import 'package:behivecompanion/presentation/features/discovery/carousel/category_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MostPopularTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var carouselHeight = screenSize.height / 2.3;
    final style = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      alignment: Alignment.topCenter,
      child: CarouselSlider(
        items: CarouselItem.create().map((item) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
            child: Card(
              elevation: 16,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                  onTap: () => print("asdas"),
                  child: Column(
                    children: <Widget>[
                      CarouselHeaderItem(
                        item.title,
                        item.pictureUrl,
                      ),
                      Container(
                        height: carouselHeight / 4,
                        child: Column(
                          children: <Widget>[
                            Row(
                                children: item.categoryList
                                    .map((category) => Flexible(child: CategoryWidget(category)))
                                    .toList()),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              child: Text(
                                item.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: style.body1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CarouselFooterItem()
                    ],
                  )),
            ),
          );
        }).toList(),
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        height: carouselHeight,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: Duration(seconds: 60),
        enlargeCenterPage: true,
        onPageChanged: (pos) => {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Container buildContainer(double carouselHeight, TextTheme style) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      alignment: Alignment.topCenter,
      child: CarouselSlider(
        items: CarouselItem.create(n: 2000).map((item) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
            child: Card(
              color: Colors.white,
              elevation: 16,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                  onTap: () => print("asdas"),
                  child: Column(
                    children: <Widget>[
                      CarouselHeaderItem(
                        item.title,
                        item.pictureUrl,
                      ),
                      Container(
                        height: carouselHeight / 4,
                        child: Column(
                          children: <Widget>[
                            Row(
                                children: item.categoryList
                                    .map((category) => Flexible(child: CategoryWidget(category)))
                                    .toList()),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child: Text(
                                item.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: style.body1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CarouselFooterItem()
                    ],
                  )),
            ),
          );
        }).toList(),
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        height: carouselHeight,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: Duration(seconds: 60),
        enlargeCenterPage: true,
        onPageChanged: (pos) => {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
