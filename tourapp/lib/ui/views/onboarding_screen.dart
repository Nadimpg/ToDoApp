import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' show lerpDouble;

import 'package:tourapp/const/app_colors.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/style/style.dart';

class Onboarding_screen extends StatelessWidget {
  @override
  List<String> _lottifiles = [
    'assets/files/lottianim1.json',
    'assets/files/lottianimi2.json',
    'assets/files/lottianimi3.json',
  ];
  List<String> _description = [
    'Welcome',
    'Categories',
    'Support',
  ];
  List<String> _title = [
    'Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur aliquet quam id dui posuere blandit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquet quam id dui posuere blandit. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur aliquet quam id dui posuere blandit',
  ];
  RxInt _currentIndex = 0.obs;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Expanded(
                  flex: 2,
                  child: Lottie.asset(_lottifiles[_currentIndex.toInt()]))),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.w)),
                        color: AppColors.scaffoldcolor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 10,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 5,
                              spreadRadius: 1.0),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            '${_description[_currentIndex.toInt()]}',
                            style: AppStyle().mytextstyle,
                          ),
                        ),
                        Obx(
                          () => Text('${_title[_currentIndex.toInt()]}'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => DotsIndicator(
                                dotsCount: _lottifiles.length,
                                position: _currentIndex.toDouble(),
                                decorator: DotsDecorator(),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_currentIndex == 2) {
                                  Get.toNamed(signup);
                                } else {
                                  _currentIndex + 1;
                                }
                              },
                              child: Container(
                                height: 37.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 165, 74, 74),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: 10,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4.0, -4.0),
                                          blurRadius: 5,
                                          spreadRadius: 1.0),
                                    ]),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
