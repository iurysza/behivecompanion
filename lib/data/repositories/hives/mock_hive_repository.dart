import 'package:behivecompanion/data/models/parse_entities/bhhive.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_error.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:rxdart/rxdart.dart';

class HiveRepositoryMock extends HiveRepository {
  @override
  Future<ApiResponse<BHive>> getFollowedHives() async {
    return Observable<ApiResponse<BHive>>.timer(
            buildResponseWith<BHive>([
              BHive()..name = "Test 0",
              BHive()..name = "Test 1",
              BHive()..name = "Test 2",
              BHive()..name = "Test 3"
            ]),
            Duration(seconds: 3))
        .first;
  }

  ApiResponse defaultError() {
    return ApiResponse(results: null, error: ApiError(0, null, null, null));
  }
}
