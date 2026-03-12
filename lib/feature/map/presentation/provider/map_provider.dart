import 'package:flutter/material.dart';

class MapProvider extends ChangeNotifier {
  int _selectedFloor = 1;
  bool _showRoute = false;

  int get selectedFloor => _selectedFloor;
  bool get showRoute => _showRoute;

  void selectFloor(int floor) {
    _selectedFloor = floor;
    notifyListeners();
  }

  void startRoute() {
    _showRoute = true;
    notifyListeners();
  }

  void cancelRoute() {
    _showRoute = false;
    notifyListeners();
  }
}