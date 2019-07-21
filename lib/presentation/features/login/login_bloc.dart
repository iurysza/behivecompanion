import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:behivecompanion/presentation/features/login/login_view_model.dart';
import 'package:flutter/cupertino.dart';

enum ViewState {
  Idle,
  Busy,
  CodeRequested,
  Error,
}

class LoginBloc extends BaseModel {
  final AuthRepository _authRepository;
  LoginViewModel vm;

  LoginBloc({@required AuthRepository authRepository})
      : vm = LoginViewModel.phoneScreen(),
        _authRepository = authRepository;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void onCountryCodeChanged(String text) {
    vm = vm.rebuild((b) => b..countryCode = text.replaceAll('+', ''));
  }

  void onPhoneChanged(String text) {
    vm = vm.rebuild((b) => b..phoneNumber = text.replaceAll(RegExp('='), ''));
  }

  void onSmsCodeChanged(String text) {
    vm = vm.rebuild((b) => b..smsCode = text);
  }

  Future<bool> requestCode() async {
    setState(ViewState.Busy);
    final response = await _authRepository.requestSmsCode(vm.countryCode, vm.phoneNumber);
    if (response.isError()) {
      setState(ViewState.Error);
    } else {
      vm = LoginViewModel.codeScreen().rebuild((b) => b
        ..phoneNumber = vm.phoneNumber
        ..countryCode = vm.countryCode);
      setState(ViewState.CodeRequested);
    }
    return true;
  }

  Future<bool> loginWithPhone() async {
    setState(ViewState.Busy);
    var response = await _authRepository.loginWithPhone(vm.countryCode, vm.phoneNumber, vm.smsCode);
    if (response.isError()) {
      setState(ViewState.Error);
    }
    return true;
  }
}
