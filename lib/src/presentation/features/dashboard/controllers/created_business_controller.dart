import 'package:get/get.dart';
import 'package:mobile_opservapp/src/src.dart';

class CreatedBusinessController extends GetxController {
  final Rx<ChartData?> _chartData = Rx<ChartData?>(null);

  ChartData? get chartData => _chartData.value;

  @override
  void onReady() {
    super.onReady();
    _loadChartData();
  }

  void _loadChartData() {
    final consultRegisterBusiness =
        getIt<IConsultRegisterBusinessChartUseCase>();
    consultRegisterBusiness.call().then((value) {
      _chartData.value = value;
    });
  }
}
