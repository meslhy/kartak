import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/shared_locale/helper.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
import 'package:graduation_project/ui/screens/main/main_screen.dart';
import 'package:graduation_project/ui/screens/splash/splash_view_model.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';


import '../../utils/app_colors.dart';




class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashViewModel viewModel = getIt();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),()async{

      if(await SharedPrefsUtils().getToken() == ""){
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }else{
        Navigator.pushReplacementNamed(context, MainScreen.routeName);
      }

    });
    SharedPreferenceGlobal.putData(key: "lastIndex", data: 0);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: AppColors.primary,
        child: const Center(
          child: Text(
            "Kartak",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: AppColors.white
            ),
          ),
        ),
      ),
      backgroundColor :  AppColors.black,
    );
  }
}
