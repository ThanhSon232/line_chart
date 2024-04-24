import 'package:flutter/material.dart';

class STVLineConfigure {
  final bool filled;
  final Color lineColor;
  final double lineWidth;
  final STVTagConfigure? tagConfigure;
  STVLineConfigure({
    this.filled = false,
    this.lineColor = Colors.yellow,
    this.lineWidth = 2.0,
    this.tagConfigure,
  });
}

class STVTagConfigure {
  final bool showTag;
  final String? title;
  final Color backgroundColor;
  final LinearGradient? textGradient;
  final LinearGradient? bgGradient;
  final TextStyle? textStyle;
  final EdgeInsets padding;

  STVTagConfigure({
    this.showTag = false,
    this.title,
    this.backgroundColor = Colors.black,
    this.textGradient,
    this.textStyle,
    this.bgGradient,
    this.padding = EdgeInsets.zero,
  });
}
