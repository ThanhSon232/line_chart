import 'package:flutter/material.dart';

class STVTileModel {
  final AxisTile? leftTile;
  final AxisTile? rightTile;
  final AxisTile? bottomTile;
  final AxisTile? topTile;

  STVTileModel({this.leftTile, this.rightTile, this.bottomTile, this.topTile});
}

class AxisTile {
  final Widget child;

  AxisTile({
    required this.child,
  });
}
