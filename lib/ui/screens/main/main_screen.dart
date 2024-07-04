import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/shared_locale/helper.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      onWillPop: (){
        if(viewModel.indexTab !=0)
        {
          viewModel.indexTab = 0;
          setState(() {});
          return Future.value(false);
        }else{
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage(
                        AppAssets.bg,

                      ),

                    )

                )
            ),
            currentScreen,
          ],
        ),
        bottomNavigationBar:navBar() ,
      ),
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
       viewModel.changeIndexTab(index);
      setState(() {
        SharedPreferenceGlobal.putData(data: index, key: 'lastIndex');
      });
    },
    currentIndex: viewModel.indexTab,
    items: [
      FloatingNavbarItem(icon: Icons.home, title: 'Home'),
      FloatingNavbarItem(icon: Icons.attach_money, title: 'cashBack'),
      FloatingNavbarItem(icon: Icons.qr_code, title: 'ScanQR'),
      FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
    ],
  );
}
