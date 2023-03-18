import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  TextStyle mytextstyle =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600);
  InputDecoration textFormDecoration(hint) =>
      InputDecoration(hintText: hint, hintStyle: TextStyle(fontSize: 12.sp));
}
