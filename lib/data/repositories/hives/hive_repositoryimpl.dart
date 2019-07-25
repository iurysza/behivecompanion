import 'package:behivecompanion/data/models/parse_entities/bhhive.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_error.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class HiveRepositoryImpl extends HiveRepository {
  @override
  Future<ApiResponse<BHive>> getFollowedHives() async {
    try {
      final response = await ParseCloudFunction('hiveManagerRetrieveJoined').execute();
      final results = buildApiResponse(response).results;

      return buildResponseWith<BHive>((results as List<Map<String, Object>>)
          .map((element) => element["hive"])
          .map((hive) => getParseObjectFrom<BHive>(BHive(), hive))
          .toList());
    } catch (e) {
      return defaultError();
    }
  }

  ApiResponse defaultError() {
    return ApiResponse(results: null, error: ApiError(0, null, null, null));
  }
}
