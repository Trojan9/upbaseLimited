import 'package:flutter/material.dart';

String validateEmail(String value) {
  String _msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    _msg = "Your Email is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Please provide a valid emal address";
  }
  return _msg;
}

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    // prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    // hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
  );
}

InputDecoration buildInputDecorationnewpass(String hintText, Widget icon) {
  return InputDecoration(
    suffixIcon: icon,
    // hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
  );
}
