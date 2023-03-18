import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/another.dart';
import 'package:getx/counter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CountControl = Get.find<Counter>();
  final box = GetStorage();
  String name = 'Nadim Hasan';
  RxBool darkMod = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Get.snackbar('Nadim Hasan', 'Life is the very much pain'),
          child: Icon(Icons.receipt),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Obx(() => Text(CountControl.value.value.toString())),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(Another());
                },
                child: Text('Another Page')),
            ElevatedButton(
                onPressed: () {
                  box.write('Name', name);
                },
                child: Text('write')),
            ElevatedButton(
                onPressed: () {
                  print(box.read('Name'));
                },
                child: Text('Read')),
            ListTile(
              title: Text('Darkmod'.tr),
              trailing: Obx(() => Switch(
                  value: darkMod.value,
                  onChanged: (bool value) {
                    darkMod.value = value;
                    Get.changeTheme(darkMod.value == false
                        ? AppTheme().lightTheme(context)
                        : AppTheme().DarkTheme(context));
                  })),
            )
          ],
        ));
  }

  AppTheme() {}
}
