import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/shared_locale/helper.dart';

import '../../utils/app_colors.dart';
import 'main_screen_view_model.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "MainRoute";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainViewModel viewModel = getIt();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = viewModel.screens[viewModel.indexTab];
    return WillPopScope(
      onWillPop: () {
        if (viewModel.indexTab != 0) {
          viewModel.indexTab = 0;
          setState(() {});
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(

        body: currentScreen,
        bottomNavigationBar: navBar(),
      ),
    );
  }

  navBar() =>FloatingNavbar(
    margin: EdgeInsets.all(0),
    padding: EdgeInsets.all(5),
    borderRadius: 20,
    backgroundColor: AppColors.black,
    iconSize: 30,
    itemBorderRadius: 20,
    unselectedItemColor: AppColors.white,
    selectedBackgroundColor: AppColors.transparent,
    selectedItemColor: AppColors.primary,
    onTap: (int index) {
      viewModel.changeIndexTab(index);
      setState(() {
        SharedPreferenceGlobal.putData(data: index, key: 'lastIndex');
      });
    },
    currentIndex: viewModel.indexTab,
    items: [
      FloatingNavbarItem(icon: Icons.home, title: 'Home'),
      FloatingNavbarItem(icon: Icons.explore, title: 'search'),
      FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
      FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
    ],
  );
}
