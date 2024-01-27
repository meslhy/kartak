import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/domain/di/di.dart';
import '../../utils/app_colors.dart';
import 'main_screen_view_model.dart';


class MainScreen extends StatefulWidget {

  static const String routeName = "MainRoute";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = viewModel.screens[viewModel.indexTab];
    return Scaffold(
      body: currentScreen,
      bottomNavigationBar:navBar() ,
    );
  }

  navBar()=>FloatingNavbar(

    borderRadius:40,
    backgroundColor: AppColors.black,
   width: MediaQuery.of(context).size.width *.8,
   iconSize: 30,
   itemBorderRadius: 20,
    unselectedItemColor: AppColors.white,
    selectedBackgroundColor: AppColors.transparent,
    selectedItemColor: AppColors.primary,
    onTap: (int index) {
      viewModel.changeIndexTab = index;
      setState(() {});
    },
    currentIndex: viewModel.indexTab,
    items: [
      FloatingNavbarItem(icon: Icons.home, title: 'Home'),
      FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
      FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
      FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
    ],
  );
}
