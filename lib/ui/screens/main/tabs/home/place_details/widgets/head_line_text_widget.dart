import 'package:flutter/material.dart';

class HeadlineTextWidget extends StatelessWidget {
  final String text;
  final Color color;

  const HeadlineTextWidget({
    Key? key,
    required this.text,
    this.color = const Color.fromRGBO(227, 163, 22, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
