import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// This is for constructing the TextFields; cartValue, deliveryDistance and Amount of items

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({@required this.label, @required this.cont});

  final String label;
  final TextEditingController cont;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
      controller: cont,
    );
  }
}
