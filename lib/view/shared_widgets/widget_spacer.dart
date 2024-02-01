import 'package:flutter/material.dart';

// Just a widget to add space wherever needed.
class WidgetSpacer extends StatelessWidget {
  double _height;
  double _width;

  WidgetSpacer({super.key, double height = 16, double width = 0})
      : _height = height,
        _width = width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
    );
  }
}
