import 'package:behivecompanion/presentation/features/statistics/bar_chart_bloc.dart';
import 'package:charts_common/common.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/basic_types.dart' as flutter;

class PeriodList extends StatelessWidget {
  final List<String> availableDates;
  final int selectedPos;
  final Function onClick;
  final List<charts.Series<BarDataEntry, String>> seriesData;

  PeriodList(this.availableDates, {this.selectedPos = 0, this.onClick, this.seriesData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 18,
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
                    onTap: () => onClick(idx),
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
        ),
        Container(
          height: 280,
          child: charts.BarChart(
            seriesData,
            defaultRenderer: charts.BarRendererConfig<String>(),
            // It is recommended that default interactions be turned off if using bar
            // renderer, because the line point highlighter is the default for time
            // series chart.
//            defaultInteractions: true,
            // If default interactions were removed, optionally add select nearest
            // and the domain highlighter that are typical for bar charts.
            behaviors: [
//              charts.SelectNearest(), charts.DomainHighlighter(),

              // Add the sliding viewport behavior to have the viewport center on the
              // domain that is currently selected.
              charts.SlidingViewport(),
              // A pan and zoom behavior helps demonstrate the sliding viewport
              // behavior by allowing the data visible in the viewport to be adjusted
              // dynamically.
              charts.PanAndZoomBehavior(),
            ],
            barRendererDecorator: BarLabelDecorator(),
            animate: true,
          ),
        )
      ],
    );
  }
}
