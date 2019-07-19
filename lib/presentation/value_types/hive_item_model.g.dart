// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_item_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HiveItemModel extends HiveItemModel {
  @override
  final String name;

  factory _$HiveItemModel([void Function(HiveItemModelBuilder) updates]) =>
      (new HiveItemModelBuilder()..update(updates)).build();

  _$HiveItemModel._({this.name}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('HiveItemModel', 'name');
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
    return other is HiveItemModel && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HiveItemModel')..add('name', name))
        .toString();
  }
}

class HiveItemModelBuilder
    implements Builder<HiveItemModel, HiveItemModelBuilder> {
  _$HiveItemModel _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  HiveItemModelBuilder();

  HiveItemModelBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
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
    final _$result = _$v ?? new _$HiveItemModel._(name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
