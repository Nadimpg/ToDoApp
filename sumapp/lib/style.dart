import 'package:flutter/material.dart';

InputDecoration AppInputStyle(label) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    fillColor: Colors.white,
    labelText: label,
    filled: true,
    border: OutlineInputBorder(),
  );
}

TextStyle AppTextStyle() {
  return TextStyle(
      fontSize: 28, fontWeight: FontWeight.w500, color: Colors.amber);
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      padding: EdgeInsets.all(22));
}
