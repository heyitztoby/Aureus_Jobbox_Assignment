import 'package:aureus_jobbox/constants.dart' as constants;
import 'package:aureus_jobbox/view/shared_widgets/widget_spacer.dart';
import 'package:flutter/material.dart';

class SignupInputFields extends StatefulWidget {
  const SignupInputFields({
    super.key,
  });

  @override
  State<SignupInputFields> createState() => _SignupInputFieldState();
}

class _SignupInputFieldState extends State<SignupInputFields> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  // Variable to check if visibility is toggled
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        _labelEmail(),
        _textFieldEmail(),
        // Space adder
        WidgetSpacer(
          height: 20.0,
        ),
        _labelNewPassword(),
        _textFieldNewPassword(),
        WidgetSpacer(
          height: 20.0,
        ),
        _labelRetypePassword(),
        _textFieldRetypePassword(),
      ],
    ));
  }

  _labelEmail() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: const Text(
        constants.EMAIL_LABEL,
        style: constants.STYLES.labelStyle,
      ),
    );
  }

  _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: Center(
          child: TextFormField(
        controller: emailController,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: constants.EMAIL_HINT_TEXT,
            hintStyle: const TextStyle(color: constants.COLORS.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
        style: constants.STYLES.inputStyle,
      )),
    );
  }

  _labelNewPassword() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: const Text(
        constants.NEW_PASSWORD_LABEL,
        style: constants.STYLES.labelStyle,
      ),
    );
  }

  _textFieldNewPassword() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Center(
          child: TextFormField(
        controller: passwordController,
        textAlign: TextAlign.left,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: constants.PASSWORD_HINT_TEXT,
            hintStyle: const TextStyle(color: constants.COLORS.grey),

            // showing/hiding password text based on the visibility toggle
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              color: constants.COLORS.grey,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
        style: constants.STYLES.inputStyle,
      )),
    );
  }

  _labelRetypePassword() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: const Text(
        constants.RETYPE_PASSWORD_LABEL,
        style: constants.STYLES.labelStyle,
      ),
    );
  }

  _textFieldRetypePassword() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Center(
          child: TextFormField(
        controller: retypePasswordController,
        textAlign: TextAlign.left,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: constants.PASSWORD_HINT_TEXT,
            hintStyle: const TextStyle(color: constants.COLORS.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
        style: constants.STYLES.inputStyle,
      )),
    );
  }
}
