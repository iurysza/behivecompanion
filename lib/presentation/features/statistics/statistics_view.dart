import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart_bloc.dart';
import 'package:behivecompanion/presentation/features/statistics/bhpie_chart.dart';
import 'package:behivecompanion/presentation/features/statistics/period_generator.dart';
import 'package:behivecompanion/presentation/features/statistics/period_list.dart';
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
                bloc: BarChartBloc(PeriodGenerator()),
                onBlocReady: (barBloc) => barBloc.initDates(),
                builder: (context, barBloc, child) => PeriodList(
                  barBloc.dateList,
                  selectedPos: barBloc.selectedDate,
                  onClick: (pos)=> barBloc.onDateSelected(pos),
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
