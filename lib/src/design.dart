import 'package:flutter/material.dart';

TextFormField textField({String labelText, TextInputType inputType, TextEditingController inputController}) {
  return TextFormField(
    controller: inputController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        gapPadding: 10.0,
        borderRadius: BorderRadius.circular(10),
      ),
      focusColor: Color(0xff5662FE),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black26),
    ),
    validator: (value) {
      if (value.isEmpty) {
        return "Field Can't be empty";
      } else {
        return null;
      }
    },
    keyboardType: inputType,
  );
}
