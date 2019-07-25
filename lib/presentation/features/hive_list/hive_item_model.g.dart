// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_item_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HiveItemModel extends HiveItemModel {
  @override
  final String name;
  @override
  final String id;
  @override
  final String pictureUrl;

  factory _$HiveItemModel([void Function(HiveItemModelBuilder) updates]) =>
      (new HiveItemModelBuilder()..update(updates)).build();

  _$HiveItemModel._({this.name, this.id, this.pictureUrl}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('HiveItemModel', 'name');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('HiveItemModel', 'id');
    }
  }

  @override
  HiveItemModel rebuild(void Function(HiveItemModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HiveItemModelBuilder toBuilder() => new HiveItemModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HiveItemModel &&
        name == other.name &&
        id == other.id &&
        pictureUrl == other.pictureUrl;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), id.hashCode), pictureUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HiveItemModel')
          ..add('name', name)
          ..add('id', id)
          ..add('pictureUrl', pictureUrl))
        .toString();
  }
}

class HiveItemModelBuilder
    implements Builder<HiveItemModel, HiveItemModelBuilder> {
  _$HiveItemModel _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _pictureUrl;
  String get pictureUrl => _$this._pictureUrl;
  set pictureUrl(String pictureUrl) => _$this._pictureUrl = pictureUrl;

  HiveItemModelBuilder();

  HiveItemModelBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _id = _$v.id;
      _pictureUrl = _$v.pictureUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HiveItemModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HiveItemModel;
  }

  @override
  void update(void Function(HiveItemModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HiveItemModel build() {
    final _$result = _$v ??
        new _$HiveItemModel._(name: name, id: id, pictureUrl: pictureUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
