import 'package:get/get.dart';

class Counter extends GetxController {
  RxInt value = 0.obs;

  CounterData() {
    value.value += 5;
    print(value.value);
  }
}
