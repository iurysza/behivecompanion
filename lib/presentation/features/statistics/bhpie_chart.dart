import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class BHPieChart extends StatelessWidget {
  final List<Series<StatsResult, int>> data;

  const BHPieChart({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(data,
        animate: true,
        defaultRenderer: ArcRendererConfig(
          arcRendererDecorators: [
            ArcLabelDecorator(
              labelPosition: ArcLabelPosition.inside,
            ),
          ],
        ));
  }
}
