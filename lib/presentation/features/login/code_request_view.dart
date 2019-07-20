import 'package:behivecompanion/presentation/custom_widgets/large_button.dart';
import 'package:behivecompanion/presentation/custom_widgets/larget_text_field.dart';
import 'package:behivecompanion/presentation/custom_widgets/screen_title.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CodeRequestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: ScreenHeaderWidget(
                title: "Qual o seu telefone?",
                subtitle: "Seu número de WhatsApp será\nseu login",
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CountryCodePicker(
                        textStyle: Theme.of(context).textTheme.body2.copyWith(fontSize: 20.0),
                        onChanged: print,
                        initialSelection: 'BR',

                        favorite: ['+01', 'US', '+55', 'BR'],
                        showCountryOnly: true,
                        alignLeft: false,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: LargeTextField(
                            textController: MaskedTextController(mask: '(00) 00000-0000'),
                            autoFocus: true,
                            labelText: "Telefone",
                            onChanged: (text) => {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                    width: double.infinity,
                    child: LargeButton(
                      text: "Continuar",
                      onPressed: () => {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
