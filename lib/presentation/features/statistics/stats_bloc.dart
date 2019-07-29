import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:charts_common/common.dart';

class StatsBloc extends BaseModel {
  List<StatsResult> itemList = [];
  List<Series<StatsResult, int>> chartDataList = [];
  StatisticsRepository _statisticsRepository;

  StatsBloc(this._statisticsRepository);

  void fetchFeaturesStats(String hiveId) async {
    final apiResponse = await _statisticsRepository.getFeatureStats(hiveId);
    if (!apiResponse.isError()) {
      this. itemList = apiResponse.results.cast<StatsResult>();
      this.chartDataList = mapToSeries(itemList);
    }
    notifyListeners();
  }


  static List<Series<StatsResult, int>> mapToSeries(List<StatsResult> data) {
    return [
      Series<StatsResult, int>(
        id: '123',
        colorFn: (StatsResult stat, int pos) => BHColor.getChartPalette(pos),
        domainFn: (StatsResult stats, _) => stats.value,
        measureFn: (StatsResult stats, _) => stats.value,
        data: data,
      )
    ];
  }
}
