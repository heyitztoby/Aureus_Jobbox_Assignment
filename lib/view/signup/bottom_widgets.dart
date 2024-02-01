import 'package:aureus_jobbox/constants.dart' as constants;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomWidgets extends StatelessWidget {
  const BottomWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Column(
      children: <Widget>[
        CreateAccountButton(),
        ExistingAccountLabel(),
        TermsAndConditionsLabel()
      ],
    ));
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        height: 45,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: constants.COLORS.primary,
              foregroundColor: constants.COLORS.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0))),
          child: const Text(constants.CREATE_ACCOUNT,
              style: constants.STYLES.normalButtonWordStyle),
        ),
      ),
    );
  }
}

class ExistingAccountLabel extends StatelessWidget {
  const ExistingAccountLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(constants.EXISTING_ACCOUNT_LABEL),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: constants.COLORS.primary,
              textStyle: constants.STYLES.labelStyle),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            constants.LOGIN_LABEL2,
            style: constants.STYLES.textButtonStyle,
          ),
        ),
      ],
    );
  }
}

class TermsAndConditionsLabel extends StatelessWidget {
  const TermsAndConditionsLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.all(20.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    text: TextSpan(children: [
                      const TextSpan(
                        text: constants.TERMS_CONDITIONS,
                        style: constants.STYLES.smallDarkTextStyle,
                      ),
                      TextSpan(
                          text: constants.TERMS_USE,
                          style: constants.STYLES.smallPrimaryTextStyle,
                          // It should open a URL when tapped, but for this assignment no URL is given.
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // launchUrl(url)
                            }),
                      const TextSpan(
                        text: " and ",
                        style: constants.STYLES.smallDarkTextStyle,
                      ),
                      TextSpan(
                          text: constants.PRIVACY_POLICY,
                          style: constants.STYLES.smallPrimaryTextStyle,
                          // It should open a URL when tapped, but for this assignment no URL is given.
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // launchUrl(url)
                            })
                    ])))));
  }
}
