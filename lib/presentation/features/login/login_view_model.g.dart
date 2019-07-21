// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginViewModel extends LoginViewModel {
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final String btnText;
  @override
  final String textLabel;
  @override
  final String countryCode;
  @override
  final String phoneNumber;
  @override
  final String smsCode;

  factory _$LoginViewModel([void Function(LoginViewModelBuilder) updates]) =>
      (new LoginViewModelBuilder()..update(updates)).build();

  _$LoginViewModel._(
      {this.title,
      this.subTitle,
      this.btnText,
      this.textLabel,
      this.countryCode,
      this.phoneNumber,
      this.smsCode})
      : super._();

  @override
  LoginViewModel rebuild(void Function(LoginViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginViewModelBuilder toBuilder() => new LoginViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginViewModel &&
        title == other.title &&
        subTitle == other.subTitle &&
        btnText == other.btnText &&
        textLabel == other.textLabel &&
        countryCode == other.countryCode &&
        phoneNumber == other.phoneNumber &&
        smsCode == other.smsCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc($jc(0, title.hashCode), subTitle.hashCode), btnText.hashCode),
                    textLabel.hashCode),
                countryCode.hashCode),
            phoneNumber.hashCode),
        smsCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginViewModel')
          ..add('title', title)
          ..add('subTitle', subTitle)
          ..add('btnText', btnText)
          ..add('textLabel', textLabel)
          ..add('countryCode', countryCode)
          ..add('phoneNumber', phoneNumber)
          ..add('smsCode', smsCode))
        .toString();
  }
}

class LoginViewModelBuilder implements Builder<LoginViewModel, LoginViewModelBuilder> {
  _$LoginViewModel _$v;

  String _title;

  String get title => _$this._title;

  set title(String title) => _$this._title = title;

  String _subTitle;

  String get subTitle => _$this._subTitle;

  set subTitle(String subTitle) => _$this._subTitle = subTitle;

  String _btnText;

  String get btnText => _$this._btnText;

  set btnText(String btnText) => _$this._btnText = btnText;

  String _textLabel;

  String get textLabel => _$this._textLabel;

  set textLabel(String textLabel) => _$this._textLabel = textLabel;

  String _countryCode;

  String get countryCode => _$this._countryCode;

  set countryCode(String countryCode) => _$this._countryCode = countryCode;

  String _phoneNumber;

  String get phoneNumber => _$this._phoneNumber;

  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _smsCode;

  String get smsCode => _$this._smsCode;

  set smsCode(String smsCode) => _$this._smsCode = smsCode;

  LoginViewModelBuilder();

  LoginViewModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _subTitle = _$v.subTitle;
      _btnText = _$v.btnText;
      _textLabel = _$v.textLabel;
      _countryCode = _$v.countryCode;
      _phoneNumber = _$v.phoneNumber;
      _smsCode = _$v.smsCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginViewModel;
  }

  @override
  void update(void Function(LoginViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginViewModel build() {
    final _$result = _$v ??
        new _$LoginViewModel._(
            title: title,
            subTitle: subTitle,
            btnText: btnText,
            textLabel: textLabel,
            countryCode: countryCode,
            phoneNumber: phoneNumber,
            smsCode: smsCode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
