import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_error.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:behivecompanion/data/repositories/utils/parse_utils.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<ApiResponse> requestSmsCode(String countryCode, String phoneNumber) async {
    final params = <String, String>{'countryCode': countryCode, 'phoneNumber': phoneNumber};
    try {
      final response = await ParseCloudFunction('phoneAuthSendCode').execute(parameters: params);
      return getApiResponse(response);
    } catch (error) {
      return ApiResponse(error: ApiError(400, "errr", true, ""));
    }
  }

  @override
  Future<ApiResponse> loginWithPhone(String countryCode, String phoneNumber, String code) async {
    final Map<String, String> params = <String, String>{
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'verificationCode': code
    };

    final response =
        await ParseCloudFunction('phoneAuthValidateCodeAndLogIn').execute(parameters: params);

    final result = response.result;

//    TODO HANDLE NEW USERS
    final isNew = ParseUtils.getObjectData(result)["is_new"] as bool;
    final sessionToken = ParseUtils.getObjectData(result)["session_token"] as String;

    return getApiResponse(await ParseUser.getCurrentUserFromServer(token: sessionToken));
  }
}
