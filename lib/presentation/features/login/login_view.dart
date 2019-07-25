import 'package:behivecompanion/helper/text_mask.dart';
import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/base/router.dart';
import 'package:behivecompanion/presentation/features/login/login_bloc.dart';
import 'package:behivecompanion/presentation/widgets/country_code_picker.dart';
import 'package:behivecompanion/presentation/widgets/large_button.dart';
import 'package:behivecompanion/presentation/widgets/larget_text_field.dart';
import 'package:behivecompanion/presentation/widgets/screen_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text(''),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Container(
        color: Colors.white,
        child: BaseWidget<LoginBloc>(
          bloc: LoginBloc(Provider.of(context)),
          builder: (context, bloc, child) => Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: ScreenHeaderWidget(
                  title: bloc.vm.title,
                  subtitle: bloc.vm.subTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      if (bloc.state == ViewState.CodeRequested)
                        PinPut(
                          autoFocus: true,
                          clearInput: true,
                          onClear: () => bloc.onSmsCodeChanged(""),
                          fieldsCount: 4,
                          onSubmit: (pin) => bloc.onSmsCodeChanged(pin),
                        ),
                      if (bloc.state != ViewState.CodeRequested && bloc.state != ViewState.Busy)
                        Row(
                          children: <Widget>[
                            CountryCodePicker(
                              onChanged: (country) => bloc.onCountryCodeChanged(country.code),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: LargeTextField(
                                  textController: MaskedTextController(mask: TextMask.brPhone()),
                                  autoFocus: true,
                                  hintText: bloc.vm.phoneHint,
                                  labelText: bloc.vm.textLabel,
                                  onChanged: (phone) => bloc.onPhoneChanged(phone),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (bloc.state == ViewState.Busy)
                        Container(
                            padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.blue),
                              strokeWidth: 5.0,
                            ))
                      else
                        Container(
                          padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                          width: double.infinity,
                          child: LargeButton(
                            text: bloc.vm.btnText,
                            onPressed: () async {
                              if (bloc.state != ViewState.CodeRequested)
                                bloc.requestCode();
                              else {
                                if (await bloc.loginWithPhone()) {
                                  Navigator.pushNamed(context, RoutePaths.HiveList);
                                }
                              }
                            },
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
