import 'package:built_value/built_value.dart';

part 'hive_item_model.g.dart';

abstract class HiveItemModel implements Built<HiveItemModel, HiveItemModelBuilder> {
  HiveItemModel._();

  String get name;

  String get id;

  @nullable
  String get pictureUrl;

  factory HiveItemModel([updates(HiveItemModelBuilder b)]) = _$HiveItemModel;
}
