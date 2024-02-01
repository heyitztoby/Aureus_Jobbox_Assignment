import 'package:flutter/foundation.dart';

class ImageChangeProvider with ChangeNotifier {
  String _imageString = "";

  String get imageString => _imageString;

  void setImageString(String value) {
    if (value != _imageString) {
      _imageString = value;
      notifyListeners();
    }
  }
}
