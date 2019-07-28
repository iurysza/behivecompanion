import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BHPieChart extends StatelessWidget {
  final List<Series<StatsResult, int>> data;
  final List<StatsResult> legendData;

  const BHPieChart({
    Key key,
    this.data,
    this.legendData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Text(
                    "Tipos de mensages",
                    style: textStyle.subhead,
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: PieChart(data,
                          animate: false,
                          defaultRenderer: ArcRendererConfig(
                            arcWidth: 30,
                            arcRendererDecorators: [
                              ArcLabelDecorator(
                                labelPosition: ArcLabelPosition.outside,
                              )
                            ],
                          ))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            child: ListView.builder(
              itemCount: legendData.length,
              itemBuilder: (ctx, idx) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        legendData[idx].label ?? "Empty",
                        style: textStyle.body2,
                      ),
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: BHColor.getPiePalette(idx),
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
