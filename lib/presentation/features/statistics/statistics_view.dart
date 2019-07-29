import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart_bloc.dart';
import 'package:behivecompanion/presentation/features/statistics/bhpie_chart.dart';
import 'package:behivecompanion/presentation/features/statistics/period_list.dart';
import 'package:behivecompanion/presentation/features/statistics/stats_bloc.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StatisticsView extends StatelessWidget {
  final String hiveId;

  StatisticsView(
    this.hiveId,
  );

  @override
  Widget build(BuildContext context) {
    return BaseWidget<StatsBloc>(
      onBlocReady: (bloc) => bloc.fetchFeaturesStats(hiveId),
      bloc: StatsBloc(Provider.of(context)),
      builder: (context, bloc, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Estatísticas',
              style: Theme.of(context).textTheme.body2,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BaseWidget<BarChartBloc>(
                bloc: BarChartBloc(Provider.of(context), Provider.of(context)),
                onBlocReady: (barBloc) => barBloc.initChart(hiveId),
                builder: (context, barBloc, child) => PeriodList(
                  barBloc.dateList,
                  seriesData: barBloc.seriesData,
                  onClick: (pos) => barBloc.fetchMessageStatsForDateAt(pos),
                ),
              ),
              Expanded(
                child: BHPieChart(data: bloc.chartDataList, legendData: bloc.itemList),
              ),
            ],
          ),
        );
      },
    );
  }
}


class SimpleBarChart extends StatelessWidget {
  final List<Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}