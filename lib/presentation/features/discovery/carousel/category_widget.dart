import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;

  const CategoryWidget(this.category);
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        child: Text(
          category,
          overflow: TextOverflow.ellipsis,
          style: style.body1.copyWith(fontSize: 12,color: Colors.white),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 4,
        ),
        decoration: ShapeDecoration(
          color: Colors.orange,
          shape: StadiumBorder(side: BorderSide(color: Colors.orange)),
        ),
      ),
    );
  }
}
