import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/data/repositories/auth/mock_auth_repository.dart';
import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:behivecompanion/presentation/features/login/login_view_model.dart';

enum ViewState {
  Idle,
  Busy,
  CodeRequested,
  Error,
}

class LoginBloc extends BaseModel {
  LoginViewModel _vm = LoginViewModel.phoneScreen();

  LoginViewModel get vm => _vm;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  final AuthRepository _authRepository;

  LoginBloc(this._authRepository);

  Future<bool> loginWithPhone() async {
    _setState(ViewState.Busy);
    var response = await _authRepository.loginWithPhone(vm.countryCode, vm.phoneNumber, vm.smsCode);
    if (response?.isError()==true) {
      setError("Algo de errado aconteceu: ${response.error.message}");
    }
    return true;
  }

  Future<bool> requestCode() async {
    if (!isValidPhone()) {
      return setError("Número inválido");
    }

    _setState(ViewState.Busy);
    final response = await _authRepository.requestSmsCode(vm.countryCode, vm.phoneNumber);
    if (response.isError()) {
      setError("Algo de errado aconteceu: ${response.error.message}");
    } else {
      _setState(ViewState.CodeRequested, () {
        _vm = LoginViewModel.codeScreen().rebuild((b) => b
          ..phoneNumber = vm.phoneNumber
          ..countryCode = vm.countryCode);
      });
    }
    return true;
  }

  void _setState(ViewState viewState, [Function block]) {
    if (block != null) block();
    _state = viewState;
    notifyListeners();
  }

  void onCountryCodeChanged(String text) {
    _vm = vm.rebuild((b) => b..countryCode = text.replaceAll('+', ''));
  }

  void onPhoneChanged(String text) {
    _vm = vm.rebuild((b) => b..phoneNumber = text.replaceAll(RegExp('[^\\d.]'), ''));
  }

  void onSmsCodeChanged(String text) {
    _vm = vm.rebuild((b) => b..smsCode = text);
  }

  bool setError(String errorMsg) {
    _setState(ViewState.Error, () {
      _vm = vm.rebuild((b) => b..errorMsg = errorMsg);
    });
    return true;
  }

  bool isValidPhone() {
    return (vm.phoneNumber.length == 11);
  }
}
