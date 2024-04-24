import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_chart/model/stv_grid_chart_model.dart';
import 'package:line_chart/model/stv_line_chart_model.dart';
import 'package:line_chart/model/stv_tile_model.dart';

part 'stv_chart_custom_paint.dart';
part 'stv_dashed_line.dart';

class STVLineChart extends StatelessWidget {
  final double maxX;
  final double maxY;

  final List<STVLineChartModel> lines;
  final STVGridChartModel? grid;
  final STVTileModel? tiles;

  const STVLineChart({
    super.key,
    required this.lines,
    this.grid,
    this.tiles,
    required this.maxX,
    required this.maxY,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (tiles?.topTile?.child != null) tiles!.topTile!.child,
        Expanded(
          child: Row(
            children: [
              if (tiles?.leftTile?.child != null) tiles!.leftTile!.child,
              Expanded(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    LayoutBuilder(builder: (context, constraints) {
                      return CustomPaint(
                        foregroundPainter:
                            _STVChartCustomPaint(lines, maxX, maxY),
                        size: Size(
                          constraints.maxWidth,
                          constraints.maxHeight,
                        ),
                      );
                    }),
                    if (grid != null)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: grid!.data
                            .map(
                              (e) => _STVDashedLine(
                                text: e.line,
                                strokeColor: grid!.configure.dashedColor,
                                height: grid!.configure.height,
                                dashWidth:
                                    grid!.configure.dashedPattern.firstOrNull ??
                                        0,
                                dashCount:
                                    grid!.configure.dashedPattern.lastOrNull ??
                                        0,
                                textStyle: e.textStyle,
                                textAlign: e.alignment,
                              ),
                            )
                            .toList(),
                      )
                  ],
                ),
              ),
              if (tiles?.rightTile?.child != null) tiles!.rightTile!.child,
            ],
          ),
        ),
        if (tiles?.bottomTile?.child != null) tiles!.bottomTile!.child,
      ],
    );
  }
}
