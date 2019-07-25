import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class LargeTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final MaskedTextController textController;
  final String labelText;
  final String hintText;
  final bool autoFocus;

  const LargeTextField(
      {Key key,
      this.textController,
      this.autoFocus = false,
      this.onChanged,
      this.labelText,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return TextField(
      autofocus: autoFocus,
      style: theme.body2.copyWith(fontSize: 20.0),
      textInputAction: TextInputAction.send,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      controller: textController,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: theme.body1.copyWith(fontSize: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }
}
