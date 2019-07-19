import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:flutter/cupertino.dart';

enum ViewState {
  Idle,
  Busy,
  LoggedIn,
  Error,
}

class LoginVM extends BaseModel {
  final AuthRepository _authRepository;

  LoginVM({@required AuthRepository authRepository})
      : smsCodeSent = false,
        _authRepository = authRepository;

  String countryCode;

  String phoneNumber;


  String _smsCode;
  String get smsCode => _smsCode;

  set smsCode(String smsCode) {
    _smsCode = smsCode;
  }

  ViewState _state = ViewState.Idle;

  bool smsCodeSent;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  bool wasCodeSent() {
    return smsCodeSent;
  }

  Future<bool> requestSms() async {
    setState(ViewState.Busy);

    final response = await _authRepository.requestSmsCode(countryCode, phoneNumber);
    if (response.isError()) {
      setState(ViewState.Error);
    } else {
      this.smsCodeSent = true;
      setState(ViewState.Idle);
    }
    return true;
  }

  Future<bool> loginWithPhone() async {
    setState(ViewState.Busy);
    var response = await _authRepository.loginWithPhone(countryCode, phoneNumber, smsCode);
    if (response.isError()) {
      setState(ViewState.Error);
      return false;
    } else {
      setState(ViewState.LoggedIn);
    }
    return true;
  }

  void onCountryCodeChanged(String text) {
    this.countryCode = text;
  }

  void onPhoneChanged(String text) {
    this.phoneNumber = text;
  }

  void onSmsCodeChanged(String text) {
    this.smsCode = text;
  }
}
