import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: IChartDataRepository)
class HttpChartDataRepository implements IChartDataRepository {
  final IHttpClient _httpClient;

  HttpChartDataRepository(this._httpClient);
  @override
  Future<ChartData> getChartData() {
    return _httpClient
        .get<JSON>('/dashboard/1')
        .then((value) => chartDataFromJSON(value));
  }
}

typedef JSON = Map<String, dynamic>;
