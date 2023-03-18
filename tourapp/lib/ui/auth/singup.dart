import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/const/app_colors.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/style/style.dart';
import 'package:tourapp/ui/widgets/violetbutton.dart';
import 'package:get/get_core/get_core.dart';

class Sing_up extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create\nYour Account ',
                  style: TextStyle(
                    color: AppColors.violetcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 12.w,
                ),
                Text(
                  ' Create your account and start your journey',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 40.w,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  obscureText: false,
                  decoration: AppStyle().textFormDecoration('E-mail Adress'),
                ),
                TextFormField(
                    controller: _passcontroller,
                    obscureText: false,
                    decoration:
                        AppStyle().textFormDecoration('Enter Password')),
                SizedBox(
                  height: 40.h,
                ),
                VioletButton('Create Account', () => Get.toNamed(userform)),
                SizedBox(
                  height: 10.w,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '--OR--',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/logo/facebook.png",
                          ),
                          iconSize: 20,
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/logo/google.png')),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                    text: 'Already an user?',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                          text: ' Log In',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.violetcolor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(singin)),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
