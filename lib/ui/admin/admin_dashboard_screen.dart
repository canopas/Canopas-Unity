import 'package:flutter/material.dart';
import 'package:projectunity/navigation/main_router_delegate.dart';
import 'package:projectunity/navigation/router_info_parser.dart';

import '../../di/service_locator.dart';
import '../../navigation/navigation_stack_item.dart';
import '../../navigation/navigation_stack_manager.dart';
import '../../utils/const/color_constant.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int selectedTab = 0;
  final _stateManager = getIt<NavigationStackManager>();
  bool show = false;

  @override
  void initState() {
    _stateManager.addListener(() {
      setState(() {
        show = _stateManager.showBottomBar;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: show
          ? BottomNavigationBar(
              backgroundColor: bottomBarColor,
              selectedItemColor: selectedBottomTab,
              unselectedItemColor: defaultBottomTab,
              selectedFontSize: 18,
              unselectedFontSize: 15,
              currentIndex: selectedTab,
              onTap: _ontap,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                    size: 34,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                    size: 34,
                  ),
                  label: 'Staff',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 34,
                  ),
                  label: 'Settings',
                ),
              ],
            )
          : null,
      body: Builder(
        builder: (context) => MaterialApp.router(
          routerDelegate: MainRouterDelegate(stack: _stateManager),
          routeInformationParser: HomeRouterInfoParser(),
        ),
      ),
    );
  }

  void _ontap(int id) {
    if (selectedTab == id) {
      return;
    }
    setState(() {
      selectedTab = id;
    });

    switch (id) {
      case 0:
        _stateManager
            .clearAndPush(const NavigationStackItem.employeeHomeState());
        break;
      case 1:
        _stateManager.clearAndPush(const NavigationStackItem.leaveState());
        break;
      case 2:
        _stateManager.clearAndPush(const NavigationStackItem.settingsState());
    }
  }
}
