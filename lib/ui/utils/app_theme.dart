import 'package:flutter/material.dart';

import 'app_colors.dart';



abstract class AppTheme{
  static  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme:const AppBarTheme(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      centerTitle: true,
    ),
    drawerTheme:const DrawerThemeData(),
    textTheme:  TextTheme(
      //todo:this style to title
      labelLarge:  TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),

      //todo:this style to small hash text
      labelMedium: TextStyle(
        color: Colors.grey[400],
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),

      //todo:this style to title of articles
      labelSmall: TextStyle(
        color: AppColors.accent,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),

      //todo:this style to date of articles
      displaySmall: TextStyle(

        fontWeight: FontWeight.w400,
        fontSize: 13,
      ),

      //todo:this style to titles
      displayLarge: TextStyle(
        color: AppColors.accent,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
  static ThemeData darkTheme =  ThemeData();
}