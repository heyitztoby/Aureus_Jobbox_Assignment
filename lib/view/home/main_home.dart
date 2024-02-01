import 'package:aureus_jobbox/provider/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;
import 'package:flutter/material.dart';
import 'widget_bottom_navigation_bar.dart';
import '../joblistings/route_joblistings.dart';
import '../appliedjobs/route_appliedjobs.dart';
import '../profile/route_profile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<PreferredSizeWidget> _appBars = [
    AppBarJobListings(),
    AppBarAppliedJobs(),
    AppBarProfile(),
  ];

  final List<Widget> _bodys = [
    const JobListings(),
    const AppliedJobsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // final email = context.watch<UserProfileProvider>.toString();
    return Consumer<BottomNavBarProvider>(
        builder: (context, bottomNavBarProvider, child) {
      return Scaffold(
          backgroundColor: constants.COLORS.bgColor,
          // Display different app bars based on the selected page in bottom navigation bar
          appBar: _appBars[bottomNavBarProvider.index],

          // Display different body based on the selected page in bottom navigation bar
          body: _bodys[bottomNavBarProvider.index],
          bottomNavigationBar: const WidgetBottomNavigationBarWidget());
    });
  }
}
