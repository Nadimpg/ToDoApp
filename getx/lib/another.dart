import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/counter.dart';

class Another extends StatelessWidget {
  final CountControl = Get.find<Counter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(CountControl.value.value.toString()),
      ),
    );
  }
}
