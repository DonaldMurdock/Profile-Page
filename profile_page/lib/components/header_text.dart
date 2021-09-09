import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({ Key? key, required this.textContent }) : super(key: key);

  final String textContent;

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0
      )
    );
  }
}