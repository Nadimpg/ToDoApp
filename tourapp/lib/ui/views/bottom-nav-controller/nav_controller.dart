import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/const/app_string.dart';
import 'package:tourapp/ui/views/bottom-nav-controller/nav_add.dart';
import 'package:tourapp/ui/views/bottom-nav-controller/nav_favorite.dart';
import 'package:tourapp/ui/views/bottom-nav-controller/nav_home.dart';

class Bottom_Nav_Controller extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;
  final _pages = [Nav_Home(), Nav_Add(), Nav_Favorite()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        left: _drawer.value == false ? 0 : 200.w,
        right: _drawer.value == false ? 0 : -200.w,
        top: _drawer.value == false ? 0 : 100.h,
        bottom: _drawer.value == false ? 0 : 100.h,
        child: Container(
          decoration: BoxDecoration(),
          child: Scaffold(
            appBar: AppBar(
              leading: _drawer.value == false
                  ? IconButton(
                      onPressed: () {
                        _drawer.value = true;
                      },
                      icon: Icon(Icons.menu))
                  : IconButton(
                      onPressed: () {
                        _drawer.value = false;
                      },
                      icon: Icon(Icons.close)),
              title: Text(AppString.appname),
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (Value) => _currentIndex.value = Value,
                currentIndex: _currentIndex.value,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add,
                      ),
                      label: 'Add'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite_outlined,
                      ),
                      label: 'Favour'),
                ]),
            body: _pages[_currentIndex.value],
          ),
        ),
      ),
    );
  }
}
