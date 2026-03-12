import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _bottomIndex = 1;

  int get bottomIndex => _bottomIndex;

  void changeBottomIndex(int index) {
    _bottomIndex = index;
    notifyListeners();
  }
}