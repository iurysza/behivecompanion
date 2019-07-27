import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:charts_common/common.dart';

class StatsBloc extends BaseModel {
  List<Series<StatsResult, int>> itemList = [];
  StatisticsRepository _statisticsRepository;

  StatsBloc(StatisticsRepository statisticsRepository)
      : _statisticsRepository = statisticsRepository;

  void fetchFeaturesStats(String hiveId) async {
    final apiResponse = await _statisticsRepository.getFeatureStats(hiveId);
    if (!apiResponse.isError()) {
      this.itemList = mapToSeries(apiResponse.results.cast<StatsResult>());
    }
    notifyListeners();
  }

  static List<Series<StatsResult, int>> mapToSeries(List<StatsResult> data) {
    return [
      Series<StatsResult, int>(
        id: '123',
        domainFn: (StatsResult stats, _) => stats.value,
        measureFn: (StatsResult stats, _) => stats.value,
        data: data,
//        labelAccessorFn: (StatsResult row, int value) => '${row.label}',
      )
    ];
  }
}
