import 'package:behivecompanion/presentation/features/statistics/bar_chart/bar_chart_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/basic_types.dart' as flutter;

class DateBarChart extends StatelessWidget {
  final List<String> availableDates;
  final int selectedPos;
  final Function onDateClick;
  final Function onMenuChanged;
  final List<charts.Series> seriesData;
  final List<MapEntry<ViewState, String>> menuOptions;
  MapEntry<ViewState, String> initialValue;

  DateBarChart(this.availableDates,
      {this.selectedPos = 0, this.onDateClick, this.seriesData, this.onMenuChanged, this.menuOptions}) {
    this.initialValue = menuOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: Text("Title")),
            DropdownButton(
              value: initialValue,
              onChanged: (period) => {onMenuChanged(period.key)},
              items: menuOptions
                  .map((data) => DropdownMenuItem(
                        value: data,
                        child: SizedBox(width: 90, child: Text(data.value)),
                      ))
                  .toList(),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height /14,
          child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: availableDates.length,
              scrollDirection: flutter.Axis.horizontal,
              itemBuilder: (ctx, idx) {
                var textStyle = Theme.of(context).textTheme;
                return Container(
                  alignment: Alignment(0.0, 0.0),
                  child: InkWell(
                    onTap: () => onDateClick(idx),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32,8,32,8),
                      child: Text(
                        availableDates[idx],
                        textAlign: TextAlign.center,
                        style: idx == selectedPos ? textStyle.body2.copyWith(fontSize: 18) : textStyle.body1.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 280,
          child: charts.BarChart(
            seriesData,
            animate: true,
          ),
        )
      ],
    );
  }
}
