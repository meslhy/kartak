import 'package:flutter/material.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  Color color ;
   LoadingWidget({super.key,this.color= AppColors.black});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(color: color,),
    );
  }
}