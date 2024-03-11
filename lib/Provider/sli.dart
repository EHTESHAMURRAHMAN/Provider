import 'package:flutter/material.dart';

class SliderChange with ChangeNotifier {
  double _value = 1.0;
  double get counter => _value;

  void increment(double val) {
    _value = val;
    notifyListeners();
  }
}
