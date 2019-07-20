import 'package:behivecompanion/data/repositories/auth/auth_repository_impl.dart';
import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/base/router.dart';
import 'package:behivecompanion/presentation/features/login/login_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.title;
    return BaseWidget<LoginVM>(
        model: LoginVM(authRepository: Provider.of<AuthRepositoryImpl>(context)),
        builder: (context, model, child) {
          return Center(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80,
                          child: TextField(
                            style: style,
                            onChanged: (text) {
                              model.onCountryCodeChanged(text);
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: "Code",
                                labelStyle:
                                    const TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
                                border:
                                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            width: 240,
                            child: TextField(
                              style: style,
                              onChanged: (text) {
                                model.onPhoneChanged(text);
                              },
                              decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  labelStyle:
                                      const TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.0))),
                            )),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: getProgress(model, style, context),
                            ),
                            Material(
                                key: Key("materialBtn"),
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0xff01A0C7),
                                child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    onPressed: () async {
                                      if (model.wasCodeSent()) {
                                        if (model.state == ViewState.LoggedIn ||
                                            await model.loginWithPhone()) {
                                          Navigator.pushNamed(context, RoutePaths.HiveList);
                                        }
                                      } else {
                                        model.requestSms();
                                      }
                                    },
                                    child: Text(getLogin(model),
                                        textAlign: TextAlign.center,
                                        style: style.copyWith(
                                            color: Colors.white, fontWeight: FontWeight.bold)))),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ));
        });
  }
}

Widget getProgress(LoginVM loginVm, TextStyle style, BuildContext context) {
  if (loginVm.state == ViewState.Busy) {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.blue), strokeWidth: 5.0);
  } else {
    if (loginVm.state == ViewState.Error) {
      return Material(
          key: Key("materialBtn"),
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () {
                if (loginVm.wasCodeSent()) {
                  loginVm.loginWithPhone();
                } else {
                  loginVm.requestSms();
                }
              },
              child: Text("Retry",
                  textAlign: TextAlign.center,
                  style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold))));
    }
    if (!loginVm.wasCodeSent() || (loginVm.state == ViewState.LoggedIn)) {
      return SizedBox.shrink();
    } else {
      return TextField(
        style: style,
        onChanged: (text) {
          loginVm.onSmsCodeChanged(text);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Sms code",
            labelStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );
    }
  }
}

String getLogin(LoginVM loginVm) {
  if (loginVm.wasCodeSent()) {
    return "Login";
  } else {
    return "Request Sms Code";
  }
}
