import 'package:aureus_jobbox/model/JobListingModel.dart';
import 'package:aureus_jobbox/provider/selected_job_listing_provider.dart';
import 'package:aureus_jobbox/sample_data/job_listing.dart';
import 'package:aureus_jobbox/view/shared_widgets/widget_spacer.dart';
import '../../constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modal/JobListingModal.dart';

class JobListings extends StatefulWidget {
  const JobListings({super.key});

  @override
  State<JobListings> createState() => _JobListingsState();
}

class _JobListingsState extends State<JobListings>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: _tabController, children: <Widget>[
      // Importing sample data for the job listings
      RecentJobListings(jobListingList: SampleJobListing().jobListingList),
      NearbyJobListings(jobListingList: SampleJobListing().jobListingList),
    ]);
  }
}

class RecentJobListings extends StatelessWidget {
  const RecentJobListings({
    super.key,
    required this.jobListingList,
  });

  final List<JobListingModel> jobListingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: jobListingList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                // Setting the selected job listing and storing the state using Provider
                context
                    .read<SelectedJobListingProvider>()
                    .setListing(jobListingList[index]);

                // Opens the JobListingModal upon tapping on any job listing
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return JobListingModal(jobListing: jobListingList[index]);
                    });
              },
              child: Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                color: constants.COLORS.white,
                child: Column(
                  children: <Widget>[
                    // Splitting the job listing into 3 different rows
                    RowWithCompanyNameAndDate(
                        jobListingList: jobListingList, index: index),
                    RowWithJobTitle(
                        jobListingList: jobListingList, index: index),
                    // Space adder
                    WidgetSpacer(
                      height: 10.0,
                    ),
                    RowWithPayAndLocation(
                        jobListingList: jobListingList, index: index),
                  ],
                ),
              ));
        });
  }
}

class NearbyJobListings extends StatelessWidget {
  const NearbyJobListings({
    super.key,
    required this.jobListingList,
  });

  final List<JobListingModel> jobListingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: jobListingList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                // Setting the selected job listing and storing the state using Provider
                context
                    .read<SelectedJobListingProvider>()
                    .setListing(jobListingList[index]);

                // Opens the JobListingModal upon tapping on any job listing
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return JobListingModal(jobListing: jobListingList[index]);
                    });
              },
              child: Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                color: constants.COLORS.white,
                child: Column(
                  children: <Widget>[
                    // Splitting the job listing into 3 different rows
                    RowWithCompanyNameAndDate(
                        jobListingList: jobListingList, index: index),
                    RowWithJobTitle(
                        jobListingList: jobListingList, index: index),
                    WidgetSpacer(
                      height: 10.0,
                    ),
                    RowWithPayAndLocation(
                        jobListingList: jobListingList, index: index),
                  ],
                ),
              ));
        });
  }
}

// Implementation of first row of job listing
class RowWithCompanyNameAndDate extends StatelessWidget {
  const RowWithCompanyNameAndDate(
      {super.key, required this.jobListingList, required this.index});

  final List<JobListingModel> jobListingList;
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
      jobListingList[index].companyName.toUpperCase(),
      style: constants.STYLES.jobListingCompanyNameStyle,
    );
  }

  _dateUploaded() {
    return Text(
      jobListingList[index].datePosted,
      style: constants.STYLES.jobListingDateStyle,
    );
  }
}

// Implementation of second row of job listing
class RowWithJobTitle extends StatelessWidget {
  const RowWithJobTitle({
    super.key,
    required this.jobListingList,
    required this.index,
  });

  final List<JobListingModel> jobListingList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _jobTitle(),
      ],
    );
  }

  _jobTitle() {
    return Text(
      jobListingList[index].jobTitle,
      style: constants.STYLES.jobListingTitleStyle,
    );
  }
}

// Implementation of third row of job listing
class RowWithPayAndLocation extends StatelessWidget {
  const RowWithPayAndLocation(
      {super.key, required this.jobListingList, required this.index});

  final List<JobListingModel> jobListingList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _moneyIcon(),
        _salaryPerMonth(),
        // Space adder
        WidgetSpacer(
          width: 10.0,
        ),
        _location(),
      ],
    );
  }

  Icon _moneyIcon() {
    return const Icon(
      Icons.attach_money,
      color: constants.COLORS.greyLight,
      size: 20.0,
    );
  }

  Text _salaryPerMonth() {
    return Text(
      jobListingList[index].salaryPerMonth,
      style: constants.STYLES.jobListingInfoStyle,
    );
  }

  Text _location() {
    return Text(
      jobListingList[index].location,
      style: constants.STYLES.jobListingInfoStyle,
    );
  }
}
