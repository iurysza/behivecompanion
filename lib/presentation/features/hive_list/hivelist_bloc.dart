import 'package:behivecompanion/data/repositories/hives/hive_repository.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:behivecompanion/presentation/features/hive_list/hive_item_model.dart';
import 'package:meta/meta.dart';

class HiveListBloc extends BaseModel {
  List<HiveItemModel> itemList = [];
  HiveRepository _hiveRepository;

  HiveListBloc({@required HiveRepository hiveRepository}) : _hiveRepository = hiveRepository;

  void getHiveList() async {
    final apiResponse = await _hiveRepository.getFollowedHives();
    if (!apiResponse.isError()) {
      this.itemList = apiResponse.results
          .map((bhHive) => HiveItemModel((b) => b
            ..name = bhHive.name
            ..pictureUrl = bhHive.avatarUrl))
          .toList();
    }
    notifyListeners();
  }

  HiveItemModel getItemAt(int pos) {
    return itemList[pos];
  }
}
