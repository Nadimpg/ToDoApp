import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tourapp/model/app_theme.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/widgets/drawer_item.dart';

class Settings extends StatelessWidget {
  RxBool darkmode = false.obs;
  final box = GetStorage();
  Future logout(context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("are u sure to logout?"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(mainhome);
                },
                child: Text('Yes')),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('No')),
          ],
        ),
      ),
    );
  }

  Future changeLanguage(context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Select your language!"),
              content: SizedBox(
                height: 200.h,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () => Get.updateLocale(
                        const Locale('bn', 'BD'),
                      ),
                      child: const Text("Bangla"),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextButton(
                      onPressed: () => Get.updateLocale(
                        const Locale('en', 'US'),
                      ),
                      child: const Text("English"),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "darkMode".tr,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  ),
                  Obx(
                    () => Switch(
                        value: darkmode.value,
                        onChanged: (bool value) {
                          darkmode.value = value;
                          Get.changeTheme(darkmode.value == false
                              ? AppTheme().lightTheme(context)
                              : AppTheme().darkTheme(context));
                        }),
                  )
                ],
              ),
              DrawerItem(() => logout(context), 'Logout'.tr),
              SizedBox(
                height: 10.h,
              ),
              DrawerItem(() => Get.toNamed(profile), 'Profile'.tr),
              SizedBox(
                height: 10.h,
              ),
              DrawerItem(() => changeLanguage(context), 'Language'),
            ],
          ),
        ),
      ),
    );
  }
}
