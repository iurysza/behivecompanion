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
              BHive()
                ..objectId = "0"
                ..fakeAvatarUrl = "https://image.flaticon.com/icons/png/128/1028/1028047.png"
                ..name = "Test 5",
              BHive()
                ..fakeAvatarUrl = "https://image.flaticon.com/icons/png/128/1191/1191608.png"
                ..objectId = "1"
                ..name = "Test 1",
              BHive()
                ..fakeAvatarUrl = "https://image.flaticon.com/icons/png/128/1191/1191608.png"
                ..objectId = "2"
                ..name = "Test 2",
              BHive()
                ..fakeAvatarUrl =
                    "https://images.vexels.com/media/users/3/137213/isolated/lists/26974c1d3b83470d74a16b1dc4c9c8de-apartment-building-city-house.png"
                ..objectId = "3"
                ..name = "Test 3"
            ]),
            Duration(milliseconds: 500))
        .first;
  }

  ApiResponse defaultError() {
    return ApiResponse(results: null, error: ApiError(0, null, null, null));
  }
}
