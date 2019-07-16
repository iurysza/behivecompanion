import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:behivecompanion/data/repositories/UserRepository.dart';
import 'package:behivecompanion/data/repositories/utils/parse_utils.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepositoryImpl extends UserRepository {

  @override
  Future<ApiResponse> requestSmsCode(String countryCode, String phoneNumber) {

    return Future.value(ApiResponse())
  }

  @override
  Future<ApiResponse> loginWithPhone(String countryCode, String phoneNumber,
      String code) async {

    final Map<String, String> params = <String, String>{
      'countryCode': '55',
      'phoneNumber': '31993942106',
      'verificationCode': '4692'
    };


    final response = await ParseCloudFunction('phoneAuthValidateCodeAndLogIn')
        .execute(parameters: params);

    final isNew = ParseUtils.getObjectData(response.result)["is_new"] as bool;
    final sessionToken = ParseUtils.getObjectData(
        response.result)["session_token"] as String;

    return getApiResponse(
        await ParseUser.getCurrentUserFromServer(token: sessionToken));
  }
