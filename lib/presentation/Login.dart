import 'package:behivecompanion/presentation/LoginVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  final style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final loginVm = Provider.of<LoginVM>(context);
    final countryCodeField = TextField(
      style: style,
      onChanged: (text) {
        loginVm.onCountryCodeChanged(text);
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Code",
          labelStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final phoneField = TextField(
      style: style,
      onChanged: (text) {
        loginVm.onPhoneChanged(text);
      },
      decoration: InputDecoration(
          labelText: "Phone Number",
          labelStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Center(
        child: SingleChildScrollView(
            child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80,
                  child: countryCodeField,
                ),
                Container(padding: const EdgeInsets.all(8.0), width: 240, child: phoneField),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: Consumer<LoginVM>(builder: (context, loginVm, _) {
                  getLogin(loginVm);

                  var progressField = getProgress(loginVm, style, context);

                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: progressField,
                      ),
                      Material(
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
                              child: Text(getLogin(loginVm),
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white, fontWeight: FontWeight.bold)))),
                    ],
                  );
                }))
          ],
        ),
      ),
    )));
  }
}

Widget getProgress(LoginVM loginVm, TextStyle style, BuildContext context) {
  if (loginVm != null && loginVm.state == ViewState.Busy) {
    return CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation(Colors.blue), strokeWidth: 5.0);
  } else {
    if (loginVm != null && !loginVm.wasCodeSent()) {
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
  if (loginVm != null && loginVm.wasCodeSent()) {
    return "Login";
  } else {
    return "Request Sms Code";
  }
}
