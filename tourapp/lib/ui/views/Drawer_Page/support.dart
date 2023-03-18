import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/suppot_field.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "If you have any problems , please contact us . We are at your service all the time.",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                supportField("Phone", "01923647795"),
                supportField("E-mail", "bsmrstunadimcse@gmail.com"),
                supportField("Facebook", "http://facebook.com/Nadim Hasan"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
