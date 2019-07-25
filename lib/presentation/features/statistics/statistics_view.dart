import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/features/statistics/stats_bloc.dart';
import 'package:charts_flutter/flutter.dart';

/// Simple pie chart with outside labels example.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsView extends StatelessWidget {
  final List<Series> seriesList;
  final bool animate;
  final String hiveId;

  StatisticsView(this.hiveId, this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory StatisticsView.withSampleData({String hiveId = ""}) {
    return StatisticsView(
      hiveId,
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<StatsBloc>(
      onBlocReady: (bloc) => bloc.getStatsList(hiveId),
      bloc: StatsBloc(Provider.of(context)),
      builder: (context, bloc, child) => PieChart(seriesList,
          animate: animate,
          // Add an [ArcLabelDecorator] configured to render labels outside of the
          // arc with a leader line.
          //
          // Text style for inside / outside can be controlled independently by
          // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
          //
          // Example configuring different styles for inside/outside:
          //        charts.ArcLabelDecorator(
          //          insideLabelStyleSpec:  charts.TextStyleSpec(...),
          //          outsideLabelStyleSpec:  charts.TextStyleSpec(...)),
          defaultRenderer: ArcRendererConfig(
              arcRendererDecorators: [ArcLabelDecorator(labelPosition: ArcLabelPosition.outside)])),
    );
  }

  /// Create one series with sample hard coded data.
  static List<Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    return [
      Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
