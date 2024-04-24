import 'package:flutter/material.dart';
import 'package:line_chart/model/stv_grid_chart_model.dart';
import 'package:line_chart/model/stv_line_chart_data.dart';
import 'package:line_chart/model/stv_line_chart_model.dart';
import 'package:line_chart/model/stv_line_configure.dart';
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
                      return RepaintBoundary(
                        child: CustomPaint(
                          painter: _STVChartCustomPaint(lines, maxX, maxY),
                          foregroundPainter: _STVTag(lines, maxX, maxY),
                          size: Size(
                            constraints.maxWidth,
                            constraints.maxHeight,
                          ),
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

class _STVTag extends CustomPainter {
  final List<STVLineChartModel> lines;
  final double maxX;
  final double maxY;

  _STVTag(this.lines, this.maxX, this.maxY);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < lines.length; i++) {
      STVLineChartData? data = lines[i].data.lastOrNull;
      if (data != null &&
          lines[i].configure.tagConfigure != null &&
          lines[i].configure.tagConfigure!.showTag) {
        var offset = Offset((data.x / maxX) * size.width,
            size.height - (data.y / maxY) * size.height);
        buildTag(size, canvas, offset, lines[i].configure.tagConfigure!);
      }
    }
  }

  void buildTag(
      Size size, Canvas canvas, Offset offset, STVTagConfigure tagConfigure) {
    var textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    var textSpan = TextSpan(
      text: tagConfigure.title,
      style: tagConfigure.textStyle?.merge(
        TextStyle(
          foreground: Paint()
            ..shader = tagConfigure.textGradient?.createShader(Rect.largest),
        ),
      ),
    );
    textPainter.text = textSpan;

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    canvas.drawRect(
        Rect.fromLTWH(
            size.width - textPainter.width - tagConfigure.padding.left * 2,
            offset.dy - textPainter.height - tagConfigure.padding.top,
            textPainter.width + tagConfigure.padding.left * 2,
            textPainter.height + tagConfigure.padding.top * 2),
        Paint()..color = tagConfigure.backgroundColor);

    textPainter.paint(
      canvas,
      Offset(size.width - (textPainter.width + tagConfigure.padding.left),
          offset.dy - textPainter.height),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
