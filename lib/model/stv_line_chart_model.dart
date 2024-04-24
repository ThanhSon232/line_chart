import 'package:line_chart/model/stv_line_chart_data.dart';
import 'package:line_chart/model/stv_line_configure.dart';

class STVLineChartModel {
  final List<STVLineChartData> data;
  final STVLineConfigure configure;

  STVLineChartModel({
    required this.data,
    required this.configure,
  });
}
