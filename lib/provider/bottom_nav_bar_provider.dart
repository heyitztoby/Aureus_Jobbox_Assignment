import 'package:flutter/foundation.dart';

class BottomNavBarProvider with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setIndex(int value) {
    if (_index != value) {
      _index = value;
      notifyListeners();
    }
  }
}
