import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/features/statistics/bhpie_chart.dart';
import 'package:behivecompanion/presentation/features/statistics/stats_bloc.dart';
import 'package:flutter/material.dart';
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
              elevation: 0),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: BHPieChart(data: bloc.itemList),
            ),
          ),
        );
      },
    );
  }
}
