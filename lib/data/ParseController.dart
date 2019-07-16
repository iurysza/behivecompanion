import 'package:behivecompanion/data/User.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ParseController {
  String _apiKey = "Q2keNQdPMD2t3dzwWANyw5w5MzaT5h6TfdVAm5oC";
  String _clientKey = "DqIrgTxQuiheDrDmABGHhqZGc5IsK8dIf0mgJRau";
  String _url = "https://parsedev.behive.io/parse/";

  Future initializeParse() async {
    await Parse().initialize(_apiKey, _url,
        clientKey: _clientKey, // Required for some setups
        debug: true, // When enabled, prints logs to console
        coreStore: await CoreStoreSharedPrefsImp
            .getInstance()); // Will use SharedPreferences instead of Sembast as an internal DB

    return ParseUser.currentUser();
  }

  Future logIn() async {
    print("first");

    final Map<String, String> params = <String, String>{
      'countryCode': '55',
      'phoneNumber': '31993942106',
      'verificationCode': '4692'
    };

    print("second");

    var firstResponse =
        await ParseCloudFunction('phoneAuthValidateCodeAndLogIn')
            .execute(parameters: params);

    if (firstResponse.success) {
      // ignore: unnecessary_brace_in_string_interps
      print("WE GOT HERE: ${firstResponse}");
    }

    var isNew = _getObjectData(firstResponse.result)["is_new"] as bool;
    var sessionToken =
        _getObjectData(firstResponse.result)["session_token"] as String;

    var secondResponse = await ParseUser.getCurrentUserFromServer(
        token: sessionToken, debug: true);
    if (secondResponse?.success ?? false) {
      return (secondResponse.result as User).name;
    } else {
      return "not logged";
    }
  }

//    final ParseResponse result =
//        await function.executeObjectFunction<ParseObject>();
//    if (result.success) {
//      if (result.result is ParseObject) {
//        final ParseObject parseObject = result.result;
//        print(parseObject.className);
//      }
//    }
//  }

  Map<String, dynamic> _getObjectData(dynamic objectData) =>
      objectData ?? Map<String, dynamic>();
}
