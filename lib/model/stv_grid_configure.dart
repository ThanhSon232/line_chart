import 'package:flutter/material.dart';

class STVGridConfigure {
  final Color dashedColor;
  final double height;
  final List<int> dashedPattern;

  STVGridConfigure({
    this.dashedColor = Colors.white,
    this.height = 1,
    this.dashedPattern = const [5, 2],
  });
}
