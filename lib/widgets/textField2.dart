import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// This is for constructing the TextFields with picker; Date and Time
class TextFieldWithPicker extends StatelessWidget {
  TextFieldWithPicker(
      {@required this.label,
      @required this.cont,
      @required this.tapMethod,
      @required this.icon});

  final String label;
  final TextEditingController cont;
  final Function tapMethod;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      controller: cont,
      onTap: tapMethod,
    );
  }
}
