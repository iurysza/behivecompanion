import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/period_generator.dart';
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
  Future<ApiResponse<List<DateStatsResult>>> getMessageCountStats(
      String hiveId, ChartPeriod period) {
    var data;
    if (period is MonthPeriod) {
      data = [
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1561939200000), 2),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1562544000000), 5),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1563148800000), 25),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1563753600000), 34),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1564358400000), 34),
      ];
    } else {
      data = [
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1561939200000), 2),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1562025600000), 5),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1562112000000), 25),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1562198400000), 14),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1562284800000), 24),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1562371200000), 4),
        DateStatsResult(DateTime.fromMillisecondsSinceEpoch(1562457600000), 10),
      ];
    }

    return Observable<ApiResponse<List<DateStatsResult>>>.timer(
            buildResponseWith<List<DateStatsResult>>(data), Duration(milliseconds: 500))
        .first;
  }
}
