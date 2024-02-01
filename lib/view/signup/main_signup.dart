import 'package:flutter/material.dart';
import '../shared_widgets/widget_spacer.dart';
import '../../constants.dart' as constants;
import 'route_signup.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Changing the default look of back button to that of the screenshot
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: constants.COLORS.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),

          centerTitle: true,
          scrolledUnderElevation: 0.0,
          title: const Text(
            constants.SIGNUP_LABEL,
            style: constants.STYLES.headerStyle,
          ),
        ),
        body: Expanded(
          child: Column(
            children: <Widget>[
              // Space adder
              WidgetSpacer(
                height: 50,
              ),

              const ImageButton(),
              WidgetSpacer(
                height: 50,
              ),

              const SignupInputFields(),
              WidgetSpacer(
                height: 50,
              ),

              const BottomWidgets(),
            ],
          ),
        ));
  }
}
