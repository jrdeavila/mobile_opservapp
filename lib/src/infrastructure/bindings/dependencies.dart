import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio {
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "X-Metabase-Session": "1d603365-60e8-49a9-86f7-5ea28acff4d1",
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        },
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    dio.interceptors.addAll(interceptors);
    return dio;
  }

  List<Interceptor> get interceptors => [
        DioTokenInterceptor(),
        DioValidatorInterceptor(),
        LogInterceptor(
          responseBody: true,
        ),
      ];
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
