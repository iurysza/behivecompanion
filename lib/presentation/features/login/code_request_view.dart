import 'package:behivecompanion/presentation/custom_widgets/screen_title.dart';
import 'package:flutter/material.dart';

class CodeRequestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''),backgroundColor: Colors.white,elevation: 0,),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0,16,32,16),
          child: Column(
            children: <Widget>[
              ScreenHeaderWidget(
                title: "Qual o seu telefone?",
                subtitle: "Seu número de WhatsApp será\n seu login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
