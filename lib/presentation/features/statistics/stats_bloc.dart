import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';

class StatsBloc extends BaseModel {
  List<StatsResult> itemList = [];
  StatisticsRepository _statisticsRepository;

  StatsBloc(
      StatisticsRepository statisticsRepository) : _statisticsRepository = statisticsRepository;

  void getStatsList(String hiveId) async {
    final apiResponse = await _statisticsRepository.getFeatureStats(hiveId);
    if (!apiResponse.isError()) {
      this.itemList = apiResponse.results.cast<StatsResult>();
    }
    notifyListeners();
  }

}
