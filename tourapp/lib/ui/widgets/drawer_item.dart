import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget DrawerItem(onclick, itemname) {
  return InkWell(
    onTap: onclick,
    child: Text(
      itemname,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
    ),
  );
}
