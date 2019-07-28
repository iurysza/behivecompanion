import 'package:parse_server_sdk/parse_server_sdk.dart';

class ParseController {
  String _apiKey = "Q2keNQdPMD2t3dzwWANyw5w5MzaT5h6TfdVAm5oC";
  String _clientKey = "DqIrgTxQuiheDrDmABGHhqZGc5IsK8dIf0mgJRau";
  String _url = "https://parsedev.behive.io/parse/";

  void initializeParse() async {
    await Parse().initialize(_apiKey, _url,
        clientKey: _clientKey, // Required for some setups
        debug: true, // When enabled, prints logs to console
        autoSendSessionId: true,
        coreStore: await CoreStoreSharedPrefsImp
            .getInstance()); // Will use SharedPreferences instead of Sembast as an internal DB
  }

  Future<bool> isLoggedIn() async {
    var currentUser = await ParseUser.currentUser();
    return await currentUser != null;
  }
}
