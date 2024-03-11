import 'package:flutter/material.dart';

class FavoriteChange with ChangeNotifier {
  List<int> _selecteditem = [];

  List<int> get selecteditem => _selecteditem;
  void toggleFavoriteadd(int value) {
    _selecteditem.add(value);
    notifyListeners();
  }

  void toggleFavoriteremove(int value) {
    _selecteditem.remove(value);
    notifyListeners();
  }
}
