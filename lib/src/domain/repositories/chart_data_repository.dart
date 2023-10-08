import 'package:mobile_opservapp/lib.dart';

abstract class IChartDataRepository {
  Future<ChartData> getChartData();
}
