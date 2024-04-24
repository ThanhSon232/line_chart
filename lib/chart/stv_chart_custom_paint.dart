part of 'stv_line_chart.dart';

class _STVChartCustomPaint extends CustomPainter {
  final List<STVLineChartModel> lines;

  _STVChartCustomPaint(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < lines.length; i++) {
      Path path = Path();
      Paint completeArc = Paint()
        ..strokeWidth = lines[i].configure.lineWidth
        ..strokeCap = StrokeCap.round
        ..style = lines[i].configure.filled
            ? PaintingStyle.fill
            : PaintingStyle.stroke
        ..color = lines[i].configure.lineColor;
      for (int j = 0; j < lines[i].data.length; j++) {
        var offset = Offset((lines[i].data[j].x / 14) * size.width,
            size.height - (lines[i].data[j].y / 6) * size.height);
        if (j == 0) {
          if (lines[i].configure.filled) {
            path.moveTo(offset.dx, size.height);
            path.lineTo(offset.dx, offset.dy);
          } else {
            path.moveTo(offset.dx, offset.dy);
          }
        } else {
          path.lineTo(offset.dx, offset.dy);
          if (lines[i].configure.filled) {
            if (j == lines[i].data.length - 1) {
              path.lineTo(offset.dx, size.height);
              path.close();
            }
          }
        }
      }
      canvas.drawPath(path, completeArc);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
