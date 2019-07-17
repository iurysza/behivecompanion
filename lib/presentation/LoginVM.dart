import 'package:behivecompanion/data/repositories/AuthRepository.dart';
import 'package:behivecompanion/di/service_locator.dart';
import 'package:flutter/cupertino.dart';

enum ViewState {
  Idle,
  Busy,
  Error,
}

class LoginVM extends ChangeNotifier {
  final AuthRepository _authRepository = serviceLocator<AuthRepository>();

  String countryCode;
  String phoneNumber;

  ViewState _state = ViewState.Idle;

  bool smsCodeSent = false;

  String smsCode;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  bool wasCodeSent() {
    return smsCodeSent != null && smsCodeSent;
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
    } else {
      setState(ViewState.Idle);
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
