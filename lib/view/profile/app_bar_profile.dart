import 'dart:ui';

import 'package:flutter/material.dart';
import '../../constants.dart' as constants;
import 'package:aureus_jobbox/provider/user_profile_provider.dart';
import 'package:provider/provider.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  AppBarProfile({super.key});

  // ignore: deprecated_member_use
  Size screenSize = WidgetsBinding.instance.window.physicalSize;
  double pixelRatio = PlatformDispatcher.instance.views.first.devicePixelRatio;

  // Getting desired device screen height using pixel ratio
  @override
  Size get preferredSize =>
      Size.fromHeight(screenSize.height / pixelRatio * 0.1);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
        builder: (context, userProfileProvider, child) {
      double deviceHeight = MediaQuery.of(context).size.height;

      return Scaffold(
        appBar: AppBar(
            scrolledUnderElevation: 0.0,
            // Ensure that the app bar height is 10% of the device screen's height.
            toolbarHeight: deviceHeight * 0.1,
            backgroundColor: constants.COLORS.bgColor,
            title: const WidgetAppBar()),
      );
    });
  }
}

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [_profileLabel(), _personIcon()],
      ),
    );
  }

  _profileLabel() {
    return Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: const Text(
          'Your ${constants.PROFILE}',
          style: constants.STYLES.welcomeSloganStyle,
        ));
  }

  _personIcon() {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: const Icon(
            Icons.person,
            size: 30.0,
          ),
        )
      ],
    ));
  }
}
