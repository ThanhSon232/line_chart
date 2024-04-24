import 'package:flutter/material.dart';

class STVGridData {
  final String line;
  final TextStyle textStyle;
  final Alignment alignment;

  STVGridData( {
    required this.line,
    this.textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.yellow,
    ),
    this.alignment= Alignment.centerRight,
  });
}
