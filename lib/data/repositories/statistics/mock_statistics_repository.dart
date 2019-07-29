import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:rxdart/rxdart.dart';

class StatisticsRepositoryMock extends StatisticsRepository {
  @override
  Future<ApiResponse<List<StatsResult>>> getFeatureStats(String hiveId) async {
    return Observable<ApiResponse<List<StatsResult>>>.timer(
            buildResponseWith<List<StatsResult>>([
              StatsResult("CryptoPrices", 100),
              StatsResult("Admin", 5),
              StatsResult("Test", 25),
              StatsResult("List", 75),
            ]),
            Duration(milliseconds: 500))
        .first;
  }

  @override
  Future<ApiResponse<List<DateStatsResult>>> getMessageCountStats(String hiveId, int from, int to) {
    return Observable<ApiResponse<List<DateStatsResult>>>.timer(
        buildResponseWith<List<DateStatsResult>>([
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559347200000), 100),
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559433600000), 5),
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559520000000), 25),
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559606400000), 34),
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559692800000), 55),
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559779200000), 44),
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559865600000), 87),
          DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1559952000000), 75),
        ]),
        Duration(milliseconds: 500))
        .first;
  }


}
