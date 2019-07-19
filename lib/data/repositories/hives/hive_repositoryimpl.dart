import 'package:behivecompanion/data/models/parse_entities/bhhive.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_error.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class HiveRepositoryImpl extends HiveRepository {
  @override
  Future<ApiResponse<BHive>> getFollowedHives() async {
    final response = await ParseCloudFunction('hiveManagerRetrieveJoined').execute();
    final results = getApiResponse(response).results;

    if (results is List<Map<String, Object>>) {
      final List<BHive> hiveList = results
          .map((element) => element["hive"])
          .map((hive) => getParseObjectFrom<BHive>(BHive(), hive))
          .toList();
      final list = getResponseOf<BHive>(hiveList);
      return list;
    } else {
      return ApiResponse(results: null, error: ApiError(0, null, null, null));
    }

//    final List<BHive> hiveList = results.map((it) {
//      final item = it as Map<String, ParseObject>;
//      return item["hive"] as BHive;
//    });
  }
}
