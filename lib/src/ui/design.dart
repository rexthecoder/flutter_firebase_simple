import 'package:flutter/material.dart';

//>>>>>>>>>>>>>> Text Field >>>>>>>>>>>>>>>>>>>//
TextFormField textField(
    {String labelText,
    TextInputType inputType,
    TextEditingController inputController}) {
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

//>>>>>>>>>>>>>> Button Design >>>>>>>>>>>>>>>>>>>//
Container btnDesign({onPressed,text}) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
    height: 45.0,
    width: double.infinity,
    child: FlatButton(
        color: Color(0xff5662FE),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
  );
}
