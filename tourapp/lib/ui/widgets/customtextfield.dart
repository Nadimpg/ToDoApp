import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextField(title, controller, {maxline}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE9EBED),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        child: TextField(
          controller: controller,
          maxLines: maxline,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15.w),
          ),
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
    ],
  );
}
