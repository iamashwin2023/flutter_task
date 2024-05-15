// lib/common_widgets.dart
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;

  const CustomTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
