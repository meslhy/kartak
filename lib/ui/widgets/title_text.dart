import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
   CustomText({super.key,this.text="",this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      textAlign: TextAlign.right,

    );
  }
}
