import 'package:behivecompanion/data/repositories/UserRepository.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:behivecompanion/data/repositories/utils/parse_utils.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<ApiResponse> requestSmsCode(String countryCode, String phoneNumber) async {
    final params = <String, String>{'countryCode': countryCode, 'phoneNumber': phoneNumber};
    final response = await ParseCloudFunction('phoneAuthSendCode').execute(parameters: params);
    return getApiResponse(response);
  }

  @override
  Future<ApiResponse> loginWithPhone(String countryCode, String phoneNumber, String code) async {
    final params = <String, String>{
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
