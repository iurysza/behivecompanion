import 'package:parse_server_sdk/parse_server_sdk.dart';

class BHive extends ParseObject implements ParseCloneable {
  BHive() : super("Hive");

  BHive.clone() : this();

  @override
  BHive clone(Map<String, dynamic> map) => BHive.clone()..fromJson(map);

  static const String keyAvatarUrl = 'picture';
  static const String keyName = 'name';

  //region NAME
  String get name => get<String>(keyName);

  set name(String name) => set<String>(keyName, name);

  //endregion

  //region AVATAR
  String get avatarUrl {
    final picture = get<ParseFile>(keyAvatarUrl);
    return (picture as ParseFile)?.url ?? "";
  }

  set avatarUrl(String avatarUrl) => set<String>(keyAvatarUrl, avatarUrl);
//endregion

}
