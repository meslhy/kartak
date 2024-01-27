import 'package:flutter/material.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
import 'package:graduation_project/ui/screens/auth/signup/register_screen.dart';
import 'package:graduation_project/ui/screens/main/main_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/profile_screen.dart';

import 'package:graduation_project/ui/screens/splash/splash_screen.dart';
import 'package:graduation_project/ui/utils/app_theme.dart';

import 'domain/di/di.dart';


void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        SplashScreen.routeName :(context) => SplashScreen(),
        LoginScreen.routeName :(context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ProfileScreen.routeName:(context) => ProfileScreen(),
        MainScreen.routeName :(context) => MainScreen(),
        HomeScreen.routeName :(context) => HomeScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}

