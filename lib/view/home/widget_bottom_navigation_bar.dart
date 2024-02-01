import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;
import '../../provider/bottom_nav_bar_provider.dart';

class WidgetBottomNavigationBarWidget extends StatefulWidget {
  const WidgetBottomNavigationBarWidget({super.key});

  @override
  State<WidgetBottomNavigationBarWidget> createState() =>
      _WidgetBottomNavigationBarWidgetState();
}

class _WidgetBottomNavigationBarWidgetState
    extends State<WidgetBottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
        builder: (context, bottomNavBarProvider, child) {
      return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // 3 different navigation bar items
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: constants.JOB_LISTINGS,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: constants.APPLIED_JOBS,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: constants.PROFILE,
          ),
        ],
        backgroundColor: constants.COLORS.white,
        // Styling selected/unselected navigation bar item
        selectedItemColor: constants.COLORS.primary,
        selectedLabelStyle: constants.STYLES.smallPrimaryTextStyle,
        unselectedItemColor: constants.COLORS.grey,
        unselectedLabelStyle: constants.STYLES.smallDarkTextStyle,

        currentIndex: bottomNavBarProvider.index,
        onTap: (index) => bottomNavBarProvider.setIndex(index),
      );
    });
  }
}
