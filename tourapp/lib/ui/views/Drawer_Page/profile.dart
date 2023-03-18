import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tourapp/const/app_colors.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/ui/style/style.dart';
import 'package:tourapp/ui/views/privacypolicy.dart';
import 'package:tourapp/ui/widgets/violetbutton.dart';

class Profile extends StatelessWidget {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final Rx<TextEditingController> _dobcontroller = TextEditingController().obs;
  final Rx<DateTime> _selectedDate = DateTime.now().obs;
  _SelectDate(BuildContext context) async {
    final select = await showDatePicker(
        context: context,
        initialDate: _selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));

    if (select != null && select != _selectedDate) {
      _dobcontroller.value.text =
          "${select.day}- ${select.month}- ${select.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tell Us More About You.',
                style: TextStyle(
                  color: AppColors.violetcolor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              Text(
                'We will not share your information outside this application.',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 40.w,
              ),
              FormField(_namecontroller, TextInputType.name, 'name'),
              FormField(_numbercontroller, TextInputType.number, 'number'),
              FormField(_addresscontroller, TextInputType.text, 'address'),
              Obx(() => TextFormField(
                    controller: _dobcontroller.value,
                    obscureText: false,
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: 'date of birth',
                        hintStyle: TextStyle(fontSize: 16.sp),
                        suffixIcon: IconButton(
                            onPressed: () => _SelectDate(context),
                            icon: Icon(Icons.calendar_month_rounded))),
                  )),
              SizedBox(
                height: 30.w,
              ),
              ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Male', 'Female'],
                onToggle: (index) {
                  print('Switched : $index');
                },
              ),
              SizedBox(
                height: 30.w,
              ),
              VioletButton('Submit', () => Get.toNamed(mainhome))
            ],
          ),
        ),
      ),
    );
  }
}

Widget FormField(controller, inputType, hint) {
  return TextFormField(
    controller: controller,
    obscureText: false,
    keyboardType: inputType,
    decoration: AppStyle().textFormDecoration(hint),
  );
}
