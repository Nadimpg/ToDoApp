import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tourapp/const/app_colors.dart';

class VioletButton extends StatelessWidget {
  String title;
  final Function onAction;
  VioletButton(this.title, this.onAction);
  RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            _value.value = true;
            onAction();
          },
          child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                  color: AppColors.violetcolor,
                  borderRadius: BorderRadius.all(Radius.circular(5.r))),
              child: _value == false
                  ? Center(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Please Wait',
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Transform.scale(
                            scale: .4, child: CircularProgressIndicator())
                      ],
                    )),
        ));
  }
}
