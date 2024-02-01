import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
  late TabController _tabController;

  TabController get tabController => _tabController;

  void setTabController(TabController value) {
    _tabController = value;
  }
}
