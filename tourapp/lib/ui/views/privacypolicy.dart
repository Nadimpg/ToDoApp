import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/const/app_colors.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/style/style.dart';
import 'package:tourapp/ui/widgets/violetbutton.dart';

class Privacy_policy extends StatelessWidget {
  const Privacy_policy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: AppColors.scaffoldcolor,
                child: Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 30.w, right: 30.w, top: 20.h, bottom: 20.h),
                        child: Text(
                          'PDF',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            VioletButton('Agree', () => Get.toNamed(mainhome))
          ],
        ),
      ),
    ));
  }
}
