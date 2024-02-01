import 'package:aureus_jobbox/model/JobListingModel.dart';
import 'package:aureus_jobbox/provider/applied_job_listing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;
import '../shared_widgets/widget_spacer.dart';

class AppliedJobsPage extends StatelessWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppliedJobListingProvider>(
        builder: (context, appliedJobListingProvider, child) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: appliedJobListingProvider.appliedList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {},
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                  color: constants.COLORS.white,
                  child: Column(
                    children: <Widget>[
                      RowWithCompanyNameAndDate(
                          appliedJobListingProvider:
                              appliedJobListingProvider.appliedList,
                          index: index),
                      RowWithJobTitle(
                          appliedJobListingProvider:
                              appliedJobListingProvider.appliedList,
                          index: index),
                      WidgetSpacer(
                        height: 10.0,
                      ),
                      RowWithPayAndLocation(
                          appliedJobListingProvider:
                              appliedJobListingProvider.appliedList,
                          index: index),
                    ],
                  ),
                ));
          });
    });
  }
}

// Implementation of first row of applied job listing
class RowWithCompanyNameAndDate extends StatelessWidget {
  const RowWithCompanyNameAndDate({
    super.key,
    required this.appliedJobListingProvider,
    required this.index,
  });

  final List<JobListingModel> appliedJobListingProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _companyName(),
        _dateUploaded(),
      ],
    );
  }

  _companyName() {
    return Text(
      appliedJobListingProvider[index].companyName.toUpperCase(),
      style: constants.STYLES.jobListingCompanyNameStyle,
    );
  }

  _dateUploaded() {
    return Text(
      appliedJobListingProvider[index].datePosted,
      style: constants.STYLES.jobListingDateStyle,
    );
  }
}

// Implementation of second row of job listing
class RowWithJobTitle extends StatelessWidget {
  const RowWithJobTitle({
    super.key,
    required this.appliedJobListingProvider,
    required this.index,
  });

  final List<JobListingModel> appliedJobListingProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _jobTitle(),
      ],
    );
  }

  _jobTitle() => Text(
        appliedJobListingProvider[index].jobTitle,
        style: constants.STYLES.jobListingTitleStyle,
      );
}

class RowWithPayAndLocation extends StatelessWidget {
  const RowWithPayAndLocation({
    super.key,
    required this.appliedJobListingProvider,
    required this.index,
  });

  final List<JobListingModel> appliedJobListingProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _moneyIcon(),
        WidgetSpacer(
          width: 5.0,
        ),
        _salaryPerMonth(),
        WidgetSpacer(
          width: 10.0,
        ),
        _location(),
      ],
    );
  }

  _moneyIcon() {
    return const Icon(
      Icons.attach_money,
      color: constants.COLORS.greyLight,
      size: 20.0,
    );
  }

  _salaryPerMonth() => Text(
        appliedJobListingProvider[index].salaryPerMonth,
        style: constants.STYLES.jobListingInfoStyle,
      );

  _location() => Text(
        appliedJobListingProvider[index].location,
        style: constants.STYLES.jobListingInfoStyle,
      );
}
