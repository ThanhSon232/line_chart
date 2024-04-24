import 'package:line_chart/model/stv_grid_configure.dart';
import 'package:line_chart/model/stv_grid_data.dart';

class STVGridChartModel {
  final List<STVGridData> data;
  final STVGridConfigure configure;

  STVGridChartModel({required this.data, required this.configure});
}
