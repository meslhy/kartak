import 'package:flutter/material.dart';


import '../../../../utils/app_colors.dart';


Widget textFF({
  required TextEditingController controller,
  required String labelText,
  bool isPass = false,
  bool isShown = true,
  IconButton? icon ,
  bool isMultiLine = false,
  bool isDark = false,
}) => TextFormField(
  controller: controller,
  style: TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold
  ),
  decoration: InputDecoration(
    filled: true,
    fillColor:Colors.white.withOpacity(.91),
    hintText: labelText,
    hintStyle: TextStyle(
      color: AppColors.black ,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10) ,
      borderSide: BorderSide(width: 5 , color: isDark? AppColors.white : AppColors.black ),
    ),
    suffixIcon: isPass?
    icon: null,
),
  obscureText: !isShown,
  keyboardType:isMultiLine? TextInputType.multiline : null,
  maxLines:isMultiLine? 5 : 1,
);




Widget buttonElevated({
  required VoidCallback function,
  required String name,
}) => ElevatedButton(
  onPressed: function,
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: AppColors.primary),
      ),
    ),
  ),
  child: Padding(
    padding: EdgeInsets.symmetric(
        vertical: 16, horizontal: 12),
    child: Row(
      children: [
        Text(name, style: TextStyle(fontSize: 18),),
        Spacer(),
        Icon(Icons.arrow_forward)
      ],
    ),
  ),
);