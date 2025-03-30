import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isBold;

  const HeaderText({
    required this.text,
    required this.fontSize,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}