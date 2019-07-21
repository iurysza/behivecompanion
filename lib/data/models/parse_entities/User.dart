import 'package:parse_server_sdk/parse_server_sdk.dart';

class User extends ParseUser implements ParseCloneable {
  User(String username, String password, String emailAddress)
      : super(username, password, emailAddress);

  User.clone() : this(null, null, null);

  @override
  User clone(Map<String, dynamic> map) => User.clone()..fromJson(map);

  static const String keyPhoneNumber = 'phoneNumber';
  static const String keyAvatarUrl = 'picture';
  static const String keyName = 'name';
  static const String keyUserName = 'username';

  //region NAME
  String get name => get<String>(keyName);

  set name(String name) => set<String>(keyName, name);

  //endregion

  //region PHONE_NUMBER
  String get phoneNumber => get<String>(keyName);

  set phoneNumber(String phoneNumber) => set<String>(keyPhoneNumber, phoneNumber);

  //endregion

  //region AVATAR
  String get avatarUrl => get<String>(keyAvatarUrl);

  set avatarUrl(String avatarUrl) => set<String>(keyAvatarUrl, avatarUrl);
//endregion

}
