import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int count = 0;
  CountData() {
    count += 5;
    print(count);
    notifyListeners();
  }
}
