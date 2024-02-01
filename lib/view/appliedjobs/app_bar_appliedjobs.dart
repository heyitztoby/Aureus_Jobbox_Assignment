import 'dart:ui';
import 'package:aureus_jobbox/provider/applied_job_listing_provider.dart';
import 'package:aureus_jobbox/view/shared_widgets/widget_spacer.dart';
import 'package:flutter/material.dart';
import '../../constants.dart' as constants;
import 'package:provider/provider.dart';

class AppBarAppliedJobs extends StatelessWidget implements PreferredSizeWidget {
  AppBarAppliedJobs({super.key});

  Size screenSize = WidgetsBinding.instance.window.physicalSize;
  double pixelRatio = PlatformDispatcher.instance.views.first.devicePixelRatio;

  // Getting desired device screen height using pixel ratio
  @override
  Size get preferredSize =>
      Size.fromHeight(screenSize.height / pixelRatio * 0.15);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Consumer<AppliedJobListingProvider>(
        builder: (context, appliedJobListingProvider, child) {
      final int listLength = appliedJobListingProvider.appliedList.length;

      return Scaffold(
        appBar: AppBar(
            scrolledUnderElevation: 0.0,
            // Ensure that the app bar is 15% of the device screen's height.
            toolbarHeight: deviceHeight * 0.15,
            backgroundColor: constants.COLORS.bgColor,
            title: WidgetAppBar(listLength: listLength)),
      );
    });
  }
}

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({
    super.key,
    required this.listLength,
  });

  final int listLength;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_appliedJobsLabel(), _editButton()],
            ),
            WidgetSpacer(
              height: 30,
            ),
            _appliedJobsText()
          ],
        ));
  }

  _appliedJobsLabel() {
    return Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: const Text(
          'Your ${constants.APPLIED_JOBS}',
          style: constants.STYLES.welcomeSloganStyle,
        ));
  }

  _editButton() {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: IconButton(
            icon: const Icon(
              Icons.edit,
              color: constants.COLORS.black,
            ),
            onPressed: () => {},
          ),
        )
      ],
    ));
  }

  _appliedJobsText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'You applied for ',
          style: constants.STYLES.appliedJobLabelStyle,
        ),

        // Number displayed is the number of jobs applied.
        _numberOfAppliedJobs(),

        // Conditional check to input job or jobs based on the number of jobs applied.
        Text(
          listLength == 1 ? ' job' : ' jobs',
          style: constants.STYLES.appliedJobLabelStyle,
        )
      ],
    );
  }

  _numberOfAppliedJobs() {
    return Text(
      listLength.toString(),
      style: constants.STYLES.numberOfAppliedJobsStyle,
    );
  }
}
