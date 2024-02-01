import 'package:flutter/material.dart';

class IncludeResumeForWorkProvider extends ChangeNotifier {
  bool _includes = true;

  bool get includes => _includes;

  void includesWork(bool value) {
    _includes = value;
    notifyListeners();
  }
}
