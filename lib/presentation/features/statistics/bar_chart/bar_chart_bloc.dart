import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/date_bar_chart_vm.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/period_generator.dart';
import 'package:charts_flutter/flutter.dart';

class BarChartBloc extends BaseModel {
  final PeriodGenerator _periodGenerator;
  final StatisticsRepository _statisticsRepository;

  DateBarChartVm model;

  BarChartBloc(this._periodGenerator, this._statisticsRepository);

  void createPeriodList() {
    model = model.rebuild((b) => b..periodList = _periodGenerator.buildPeriodList(model.period));
    model = model.rebuild((b) => b..dateList = _periodGenerator.buildFor(model.period));
    notifyListeners();
  }

  void initChart(String hiveId) {
    model = DateBarChartVm.init(hiveId);
    createPeriodList();
    fetchMessageStatsForDateAt(0);
  }

  void onPeriodFilterChanged(ViewState period) {
    model = model.rebuild((b) => b..currentPeriodType = {period: model.menuOptions[period]});
    notifyListeners();
  }

  List<Series<BarDataEntry, String>> mapToSeries(List<BarDataEntry> data) {
    return [
      Series<BarDataEntry, String>(
        id: 'Messages',
        colorFn: (_, __) => BHColor.getChartPalette(0),
        labelAccessorFn: (BarDataEntry stats, _) => stats.value.toString(),
        domainFn: (BarDataEntry stats, _) => _periodGenerator.getBarEntryFormat(stats.period),
        measureFn: (BarDataEntry stats, _) => stats.value,
        data: data,
      )
    ];
  }

  void fetchMessageStatsForDateAt(int selectedDate) async {
    model = model.rebuild((b) => b..currentPeriodPos = selectedDate);
    var period = model.periodList[selectedDate];
    final apiResponse = await _statisticsRepository.getMessageCountStats(
      model.hiveId,
      period,
    );

    if (!apiResponse.isError()) {
      final entryList = apiResponse.results.cast<DateStatsResult>().map((e) {
        final datePeriod = _periodGenerator.createDatePeriod(model.period, e.date);
        return BarDataEntry(datePeriod, e.value);
      }).toList();

      model = model.rebuild((b) => b..seriesData = mapToSeries(entryList));
    }

    notifyListeners();
  }
}

enum ViewState {
  Month,
  Week,
}

class BarDataEntry {
  ChartPeriod period;
  int value;

  BarDataEntry(this.period, this.value);
}
