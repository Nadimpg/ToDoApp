import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/ui/views/bottom-nav-controller/nav_controller.dart';
import 'package:tourapp/ui/views/drawer_screen.dart';

class Main_Home_Screen extends StatelessWidget {
  Future exitDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Are you sure to close this app ??',
            ),
            content: Row(
              children: [
                ElevatedButton(onPressed: () => Get.back(), child: Text('No')),
                SizedBox(
                  width: 20.h,
                ),
                ElevatedButton(
                    onPressed: () => SystemNavigator.pop(), child: Text('Yes')),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Drawer_Screen(),
            Bottom_Nav_Controller(),
          ],
        ),
      ),
    );
  }
}
