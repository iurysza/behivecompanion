import 'package:behivecompanion/data/repositories/utils/api_response.dart';

abstract class AuthRepository {
  Future<ApiResponse> requestSmsCode(String countryCode, String phoneNumber);

  Future<ApiResponse> loginWithPhone(String countryCode, String phoneNumber, String code);
}
