import 'dart:ui';

import 'package:aureus_jobbox/view/shared_widgets/widget_spacer.dart';
import 'package:flutter/material.dart';
import '../../constants.dart' as constants;
import 'package:aureus_jobbox/provider/user_profile_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/tab_bar_provider.dart';

class AppBarJobListings extends StatelessWidget implements PreferredSizeWidget {
  AppBarJobListings({super.key});

  // ignore: deprecated_member_use
  Size screenSize = WidgetsBinding.instance.window.physicalSize;
  double pixelRatio = PlatformDispatcher.instance.views.first.devicePixelRatio;

  // Getting desired device screen height using pixel ratio
  @override
  Size get preferredSize =>
      Size.fromHeight(screenSize.height / pixelRatio * 0.25);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
        builder: (context, userProfileProvider, child) {
      double deviceHeight = MediaQuery.of(context).size.height;
      String name = userProfileProvider.fullName;

      return Scaffold(
          appBar: AppBar(
              backgroundColor: constants.COLORS.primary,
              // Ensure appbar height is 25% of device screen regardless of which device
              toolbarHeight: deviceHeight * 0.25,
              scrolledUnderElevation: 0.0,
              title: Column(
                children: <Widget>[
                  WelcomeMessage(name: name),
                  WidgetSpacer(
                    height: 5.0,
                  ),
                  const WelcomeSlogan(),
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(deviceHeight * 0.05),
                  child: const Column(
                    children: [
                      SearchBarWidget(),
                      TabBarWidget(),
                    ],
                  ))));
    });
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          constants.WELCOME_MESSAGE + name,
          style: constants.STYLES.welcomeTextStyle,
        ),
        Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(left: 5.0),
          child: const Image(image: AssetImage('assets/HandWaveEmoji.png')),
        ),
      ],
    );
  }
}

class WelcomeSlogan extends StatelessWidget {
  const WelcomeSlogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Text(
          constants.SLOGAN,
          style: constants.STYLES.welcomeSloganStyle,
        )
      ],
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
        height: 40,
        width: deviceWidth - 32,
        margin: const EdgeInsets.only(
          bottom: 20.0,
        ),

        // Implementation of search box
        child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
          return _searchBar(controller);
        }, suggestionsBuilder:
                (BuildContext context, SearchController controller) {
          return _searchBoxDisplay(controller);
        }));
  }

  _searchBar(SearchController controller) {
    return SearchBar(
      controller: controller,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      onChanged: (_) {
        // No styling options were made for the controller below.
        controller.openView();
      },

      // Styling for the search box, icon and text.
      leading: const Icon(
        Icons.search,
        color: constants.COLORS.grey,
      ),
      hintText: constants.JOB_SEARCH_BAR_HINT,
      hintStyle: MaterialStateProperty.all(
          const TextStyle(color: constants.COLORS.primaryLight2)),
      backgroundColor: MaterialStateProperty.all(constants.COLORS.primaryLight),
      elevation: MaterialStateProperty.all(0.0),
      shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      )),
      textStyle: MaterialStateProperty.all(constants.STYLES.inputStyle),
    );
  }

  // The below function is not linked with the job search, just for demo purposes.
  _searchBoxDisplay(SearchController controller) {
    return List<ListTile>.generate(5, (int index) {
      final String item = '$index';
      return ListTile(
        title: Text(item),
        onTap: () {
          setState(() {
            controller.closeView(item);
          });
        },
      );
    });
  }
}

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  // Initialising the retrieved tab bar.
  TabBar get _tabBar => TabBar(
        controller: _tabController,
        indicatorColor: constants.COLORS.primary,
        labelStyle: constants.STYLES.textButtonStyle,
        unselectedLabelColor: constants.COLORS.grey,
        dividerColor: constants.COLORS.bgColor,
        tabs: const <Widget>[
          Tab(
            text: constants.RECENT_JOBS,
          ),
          Tab(
            text: constants.NEAR_YOU,
          ),
        ],
      );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<TabBarProvider>().setTabController(_tabController);
    return Material(
      color: constants.COLORS.bgColor,
      child: _tabBar,
    );
  }
}
