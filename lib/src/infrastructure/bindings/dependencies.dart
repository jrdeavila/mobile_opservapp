import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          followRedirects: false,
          headers: {
            "X-Metabase-Session": "1d603365-60e8-49a9-86f7-5ea28acff4d1",
          },
        ),
      )..interceptors.addAll(interceptors);

  List<Interceptor> get interceptors => [
        TokenInterceptor(),
        ValidatorInterceptor(),
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
