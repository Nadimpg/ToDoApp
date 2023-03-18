import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/views/bottom-nav-controller/search_screen.dart';

class Nav_Home extends StatefulWidget {
  @override
  State<Nav_Home> createState() => _Nav_HomeState();
}

class _Nav_HomeState extends State<Nav_Home> {
  @override
  List<String> _lottifiles = [
    'assets/files/lottianim1.pdb',
    'assets/files/lottianimi2.json',
    'assets/files/lottianimi3.json',
  ];

  RxInt _currentIndex = 0.obs;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CarouselSlider(
                  items: _lottifiles
                      .map((item) => Padding(
                            padding: EdgeInsets.only(left: 3, right: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(item),
                                      fit: BoxFit.fill)),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      height: 200.h,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.9,
                      onPageChanged: (val, carouselPageChangedReason) {
                        setState(() {
                          _currentIndex.value = val;
                        });
                      })),
              SizedBox(
                height: 5.h,
              ),
              Obx(
                () => DotsIndicator(
                  dotsCount: _lottifiles.length == 0 ? 1 : _lottifiles.length,
                  position: _currentIndex.value.toDouble(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                child: InkWell(
                  onTap: () => Get.toNamed(search),
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_outlined,
                            size: 20.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Search for your next tour",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
