import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText ;
  bool isPassword ;
  bool notPreIcon ;
  TextEditingController controller ;
  String? Function(String?)? validator;
  TextInputType type ;

  CustomTextFormField({
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator ,
    required this.type ,
    this.notPreIcon = false
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon:  Icon(notPreIcon? null:isPassword?Icons.password:Icons.account_circle_outlined),
        prefixIconColor: Colors.white,
        filled:  true ,
        hintText: hintText ,
        hintStyle: const TextStyle(
            color: Color.fromRGBO(
                233, 233, 236, 0.5019607843137255),
          ),
        fillColor: Colors.transparent,
        border: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors
                  .white), // Border color when focused
        ),
      ),
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Colors.white),
      controller: controller,
      validator: validator,
      keyboardType: type ,
      obscureText: isPassword,

    );
  }
}