import 'package:built_value/built_value.dart';

part 'package:behivecompanion/presentation/features/hive_list/hive_item_model.g.dart';

abstract class HiveItemModel implements Built<HiveItemModel, HiveItemModelBuilder> {
  HiveItemModel._();

  String get name;

  @nullable
  String get pictureUrl;

  factory HiveItemModel([updates(HiveItemModelBuilder b)]) = _$HiveItemModel;
}
