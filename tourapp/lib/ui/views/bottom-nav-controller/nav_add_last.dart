import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/customtextfield.dart';
import '../../widgets/violetbutton.dart';

class Nav_Add_Last extends StatefulWidget {
  @override
  State<Nav_Add_Last> createState() => _Nav_Add_LastState();
}

class _Nav_Add_LastState extends State<Nav_Add_Last> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _dateTimeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  Future multipleImagePicker() async {
    var multipleImages = await _picker.pickMultiImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var multipleImages;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField("Phone Number", _phoneController),
                customTextField("Destination Date & Time", _dateTimeController),
                Text(
                  "Choose Images",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9EBED),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.r),
                    ),
                  ),
                  child: Center(
                    child: FloatingActionButton(
                      onPressed: () => multipleImagePicker(),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: multipleImages?.length ?? 0,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Container(
                          width: 100,
                          child: multipleImages?.length == null
                              ? const Center(
                                  child: Text("Images are empty"),
                                )
                              : Center(
                                  child: Text("Images are empty"),
                                ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                VioletButton("Upload", () {
                  Get.back();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
