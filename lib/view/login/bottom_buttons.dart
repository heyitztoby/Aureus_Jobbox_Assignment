import 'package:aureus_jobbox/constants.dart' as constants;
import 'package:aureus_jobbox/provider/user_profile_provider.dart';
import 'package:aureus_jobbox/view/home/route_home.dart';
import 'package:aureus_jobbox/view/shared_widgets/widget_spacer.dart';
import 'package:aureus_jobbox/view/signup/route_signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Space adder
        WidgetSpacer(
          height: 20.0,
        ),
        const ForgotPasswordButton(),
        WidgetSpacer(height: 16.0),
        const LoginButton(),
        const NoAccountLabel(),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
        builder: (context, userProfileProvider, child) {
      return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              // Setting the sample user details upon clicking login, supposed to connect to server and retrieve details but no server is set up for this demo purpose.
              userProfileProvider.setFullName('Adrian Severin');
              userProfileProvider.setEmail('Adrianseverin@gmail.com');
              userProfileProvider.setMobileNumber('+6594717281');

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: constants.COLORS.primary,
                foregroundColor: constants.COLORS.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0))),
            child: const Text(
              constants.LOGIN_LABEL,
              style: constants.STYLES.normalButtonWordStyle,
            ),
          ),
        ),
      );
    });
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(foregroundColor: constants.COLORS.black),
        onPressed: () {},
        child: const Text(
          constants.FORGOT_PASSWORD,
          style: constants.STYLES.labelStyle,
        ),
      ),
    );
  }
}

class NoAccountLabel extends StatelessWidget {
  const NoAccountLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          constants.NO_ACCOUNT_LABEL,
          style: constants.STYLES.labelStyle,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: constants.COLORS.primary,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignupPage()));
          },
          child: const Text(
            constants.SIGNUP_LABEL,
            style: constants.STYLES.textButtonStyle,
          ),
        ),
      ],
    );
  }
}
