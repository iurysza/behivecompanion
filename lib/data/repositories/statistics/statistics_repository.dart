import 'package:behivecompanion/data/models/stats_result.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';

abstract class StatisticsRepository {
  Future<ApiResponse<List<StatsResult>>> getFeatureStats(String hiveId);
  Future<ApiResponse<List<DateStatsResult>>> getMessageCountStats(String hiveId,int  from, int to);
}
