import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:behivecompanion/presentation/features/statistics/period_generator.dart';
import 'package:charts_flutter/flutter.dart';

class BarChartBloc extends BaseModel {
  final PeriodGenerator _periodGenerator;
  final StatisticsRepository _statisticsRepository;

  String _hiveId;
  ViewState _period = ViewState.Month;
  List<ChartPeriod> _periodList = [];

  List<Series<BarDataEntry, String>> seriesData = [];
  List<String> dateList = [];

  BarChartBloc(this._periodGenerator, this._statisticsRepository) {
    createPeriodList();
  }

  void createPeriodList() {
    if (_period == ViewState.Month) {
      _periodList = _periodGenerator.createMonthList();
    } else {
      _periodList = _periodGenerator.createWeekList();
    }
    dateList = _periodList.map((e) => _periodGenerator.getPeriodListFormat(e)).toList();
    notifyListeners();
  }

  void initChart(String hiveId) {
    _hiveId = hiveId;
    createPeriodList();
    fetchMessageStatsForDateAt(0);
  }

  List<Series<BarDataEntry, String>> mapToSeries(List<BarDataEntry> data) {
    return [
      Series<BarDataEntry, String>(
        id: '123',
        colorFn: (BarDataEntry stat, int pos) => BHColor.getChartPalette(0),
        domainFn: (BarDataEntry stats, _) => _periodGenerator.getPeriodListFormat(stats.period),
        measureFn: (BarDataEntry stats, _) => stats.value,
        data: data,
      )
    ];
  }

  void fetchMessageStatsForDateAt(int selectedDate) async {
    var selectedPeriod = _periodList[selectedDate];
    final apiResponse = await _statisticsRepository.getMessageCountStats(_hiveId,
        selectedPeriod.from.millisecondsSinceEpoch, selectedPeriod.to.millisecondsSinceEpoch);
    if (!apiResponse.isError()) {
      final barDataEntryList = apiResponse.results.cast<DateStatsResult>().map((e) {
        final datePeriod = _periodGenerator.createDatePeriod(_period, e.date);
        return BarDataEntry(datePeriod, e.value);
      }).toList();

      seriesData = mapToSeries(barDataEntryList);
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
