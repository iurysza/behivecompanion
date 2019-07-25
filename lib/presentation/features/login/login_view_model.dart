import 'package:built_value/built_value.dart';

part 'login_view_model.g.dart';

abstract class LoginViewModel implements Built<LoginViewModel, LoginViewModelBuilder> {
  LoginViewModel._();

  @nullable
  String get title;

  @nullable
  String get phoneHint;

  @nullable
  String get subTitle;

  @nullable
  String get btnText;

  @nullable
  String get textLabel;

  @nullable
  String get countryCode;

  @nullable
  String get phoneNumber;

  @nullable
  String get smsCode;
  @nullable
  String get errorMsg;

  factory LoginViewModel([updates(LoginViewModelBuilder b)]) = _$LoginViewModel;

  factory LoginViewModel.phoneScreen() {
    return LoginViewModel((b) => b
      ..title = "Qual o seu telefone?"
      ..subTitle = "Seu número de WhatsApp será\nseu login"
      ..btnText = "Continuar"
      ..countryCode = "55"
      ..phoneHint = "(00) 00000-0000"
      ..textLabel = "Telefone");
  }

  factory LoginViewModel.codeScreen() {
    return LoginViewModel((b) => b
      ..title = "Envie o código"
      ..subTitle = "Enviamos um código para o seu número, digite os 4 dígitos nos campos abaixo"
      ..btnText = "Enviar"
      ..textLabel = "");
  }
}
