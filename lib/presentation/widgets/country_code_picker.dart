import 'package:country_code_picker/country_code_picker.dart' as Lib;
import 'package:flutter/material.dart';

class CountryCodePicker extends StatelessWidget {
  final ValueChanged<Lib.CountryCode> onChanged;

  const CountryCodePicker({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lib.CountryCodePicker(
      textStyle: Theme.of(context).textTheme.body2.copyWith(fontSize: 20.0),
      onChanged: (countryCode) => onChanged(countryCode),
      initialSelection: 'BR',
      favorite: ['+01', 'US', '+55', 'BR'],
      showCountryOnly: true,
      alignLeft: false,
    );
  }
}
