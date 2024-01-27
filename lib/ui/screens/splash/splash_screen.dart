import 'package:flutter/material.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';


import '../../utils/app_colors.dart';




class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Center(
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
