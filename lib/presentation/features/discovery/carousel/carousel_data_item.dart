import 'dart:math';

import 'package:faker/faker.dart';

class CarouselItem {
  String title;
  String description;
  String pictureUrl;
  String memberCount;
  List<String> categoryList;

  CarouselItem({this.title, this.description, this.pictureUrl, this.memberCount,this.categoryList});

  static List<CarouselItem> create({int n = 10}) {
    var rnd = Random();
    return List.generate(n, (i) {
      int id = rnd.nextInt(377);
      return CarouselItem(
          description:
              "$i Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          memberCount: "$i memberCount",
          categoryList: ["${faker.food.cuisine() + faker.food.cuisine() + faker.food.cuisine()}",faker.sport.name(),faker.job.title()],
          pictureUrl: "https://picsum.photos/id/$id/400/200",
          title: "$i ${faker.company.name()}");
    });
  }
}
