import 'package:flutter/material.dart';

class IncludeResumeForEducationProvider extends ChangeNotifier {
  bool _includes = true;

  bool get includes => _includes;

  void includesEducation() {
    _includes = !_includes;
    notifyListeners();
  }
}
