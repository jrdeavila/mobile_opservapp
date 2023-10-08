import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@injectable
class ValidatorInterceptor extends Interceptor {
  final IValidatorService _validatorService = getIt();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 422) {
      Map<String, List<dynamic>> errors =
          err.response?.data['errors'].cast<String, List>();

      _validatorService.saveErrors(errors);
    }
    super.onError(err, handler);
  }
}

@injectable
class TokenInterceptor extends Interceptor {
  final TokenRepository _repository = getIt();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _repository.getToken().then((value) {
      if (value != null) {
        options.headers['Authorization'] = 'Bearer $value';
      }
      super.onRequest(options, handler);
    });
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if ((response.data as Map).containsKey('access_token')) {
      _repository.persistToken(response.data['access_token']);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _repository.deleteToken();
    }
    super.onError(err, handler);
  }
}
