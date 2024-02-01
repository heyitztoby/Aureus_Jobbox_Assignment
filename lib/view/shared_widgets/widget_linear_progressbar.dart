import 'package:flutter/material.dart';
import '../../constants.dart' as constants;

class WidgetLinearProgressBar extends StatefulWidget {
  const WidgetLinearProgressBar({super.key, required this.determinateValue});
  final double determinateValue;

  @override
  State<WidgetLinearProgressBar> createState() =>
      _WidgetLinearProgressBarState();
}

class _WidgetLinearProgressBarState extends State<WidgetLinearProgressBar> {
  bool determinate = true;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.determinateValue,
      semanticsLabel: 'Linear progress indicator',
      valueColor: const AlwaysStoppedAnimation<Color>(constants.COLORS.primary),
      backgroundColor: constants.COLORS.primaryLight4,
      minHeight: 8.0,
    );
  }
}
