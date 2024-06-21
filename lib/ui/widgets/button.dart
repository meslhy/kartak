import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_theme.dart';

class CustomButton extends StatelessWidget {
  Function()? onPressed;
  String? text;
  Color color;
   CustomButton({super.key,this.onPressed,this.text,this.color =AppColors.accent  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *.06,
      child: ElevatedButton(
        onPressed: onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // background color// text color
          elevation: 5, // button's elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),// when it's pressed
        ),
        child: Text(
          text??"",
          style: TextStyle(
            fontSize: AppTheme.lightTheme.textTheme.labelLarge?.fontSize ?? 20,
            fontWeight: AppTheme.lightTheme.textTheme.labelLarge?.fontWeight ?? FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
