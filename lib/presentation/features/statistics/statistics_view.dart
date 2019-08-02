import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/bar_chart_bloc.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/date_bar_chart.dart';
import 'package:behivecompanion/presentation/features/statistics/bhpie_chart.dart';
import 'package:behivecompanion/presentation/features/statistics/stats_bloc.dart';
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
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Estatísticas',
            style: Theme.of(context).textTheme.body2,
          ),
          backgroundColor: Colors.white,
          elevation: 4,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BaseWidget<BarChartBloc>(
                bloc: BarChartBloc(Provider.of(context), Provider.of(context)),
                onBlocReady: (barBloc) => barBloc.initChart(hiveId),
                builder: (context, barBloc, child) => DateBarChart(
                  barBloc.model.dateList,
                  menuOptions: barBloc.model.periodTypeItems,
                  onMenuChanged: (period) => barBloc.onPeriodFilterChanged(period),
                  seriesData: barBloc.model.seriesData,
                  onDateClick: (pos) => barBloc.fetchMessageStatsForDateAt(pos),
                ),
              ),
              BaseWidget<StatsBloc>(
                onBlocReady: (bloc) => bloc.fetchFeaturesStats(hiveId),
                bloc: StatsBloc(Provider.of(context)),
                builder: (context, bloc, child) {
                  return SizedBox(
                    height: 600,
                    child: BHPieChart(
                      data: bloc.chartDataList,
                      legendData: bloc.itemList,
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
