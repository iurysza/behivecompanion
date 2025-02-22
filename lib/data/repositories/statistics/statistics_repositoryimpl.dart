import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/period_generator.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class StatisticsRepositoryImpl extends StatisticsRepository {
  @override
  Future<ApiResponse<List<StatsResult>>> getFeatureStats(String hiveId) async {
    final Map<String, String> params = <String, String>{
      'object_id': hiveId,
    };
    final response = await ParseCloudFunction('getFeaturesUsageByHive').execute(parameters: params);
    final results = buildApiResponse(response).results;

    return buildResponseWith<List<StatsResult>>((results as List<Map<String, Object>>)
        .map(
          (element) => StatsResult(element["feature"] as String, element["count"] as int),
        )
        .toList());
  }

  @override
  Future<ApiResponse<List<DateStatsResult>>> getMessageCountStats(
      String hiveId, ChartPeriod period) async {
    final Map<String, Object> params = <String, Object>{
      'object_id': hiveId,
      'from': period.from.millisecondsSinceEpoch,
      'to': period.to.millisecondsSinceEpoch,
      'unit': period is MonthPeriod ? "week" : "day",
    };
    final response = await ParseCloudFunction('getHiveMessagesStats').execute(parameters: params);
    final results = buildApiResponse(response).results;

    return buildResponseWith<List<DateStatsResult>>((results as List<Map<String, Object>>)
        .map(
          (element) => DateStatsResult(
              DateTime.fromMillisecondsSinceEpoch(element["date"] as int, isUtc: true),
              element["value"] as int),
        )
        .toList());
  }
}
