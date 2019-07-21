import 'package:behivecompanion/data/models/parse_entities/bhhive.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';

abstract class HiveRepository {
  Future<ApiResponse<BHive>> getFollowedHives();
}
