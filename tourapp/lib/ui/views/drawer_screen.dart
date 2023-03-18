import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/widgets/drawer_item.dart';

import '../../const/app_string.dart';
import '../style/style.dart';

class Drawer_Screen extends StatelessWidget {
  const Drawer_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.appname, style: AppStyle().mytextstyle),
            Text(
              'Travel Agency',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            DrawerItem(() => Get.toNamed(support), 'Support'),
            DrawerItem(() => Get.toNamed(privacys), 'Privacy'),
            DrawerItem(() => Get.toNamed(faq), 'Faq'),
            DrawerItem(() => Get.toNamed(howtouse), 'How to use'),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () => Get.toNamed(settings),
              child: Text(
                'Setting',
                style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
