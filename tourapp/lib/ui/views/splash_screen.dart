import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tourapp/const/app_string.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/style/style.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  final box = GetStorage();
  Future choosescreen() async {
    var userId = box.read('uid');
    print(userId);
    if (userId == null) {
      Get.toNamed(onboard);
    } else {
      Get.toNamed(mainhome);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => choosescreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 100.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(AppString.appname, style: AppStyle().mytextstyle)
        ],
      ),
    ));
  }
}
