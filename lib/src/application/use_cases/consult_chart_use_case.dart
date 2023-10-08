import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: IConsultRegisterBusinessChartUseCase)
class ConsultRegisterBusinessChartUseCase
    implements IConsultRegisterBusinessChartUseCase {
  final IChartDataRepository chartRepository;

  ConsultRegisterBusinessChartUseCase(this.chartRepository);
  @override
  Future<ChartData> call() {
    return chartRepository.getChartData();
  }
}
