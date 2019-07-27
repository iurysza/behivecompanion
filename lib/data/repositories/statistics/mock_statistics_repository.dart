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
}
