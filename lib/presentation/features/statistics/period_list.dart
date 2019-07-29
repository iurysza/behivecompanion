import 'package:flutter/material.dart';

class PeriodList extends StatelessWidget {
  final List<String> availableDates;
  final int selectedPos;
  final Function onClick;

  PeriodList(this.availableDates, {this.selectedPos = 0, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      child: ListView.builder(
        shrinkWrap: true,
          reverse: true,
          itemCount: availableDates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, idx) {
            var textStyle = Theme.of(context).textTheme;
            return Container(
              alignment: Alignment(0.0, 0.0),
              child: InkWell(
                onTap: ()=> onClick(idx),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    availableDates[idx],
                    textAlign: TextAlign.center,
                    style: idx == selectedPos ? textStyle.body1 : textStyle.body1,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
