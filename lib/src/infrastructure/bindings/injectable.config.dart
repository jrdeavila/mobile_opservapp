// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../../lib.dart' as _i4;
import '../../application/use_cases/authentication_use_case.dart' as _i17;
import '../../application/use_cases/consult_chart_use_case.dart' as _i16;
import '../../presentation/features/authentication/controllers/authentication_controller.dart'
    as _i9;
import '../cache/cache_service.dart' as _i13;
import '../http/banner/custom_banner_service.dart' as _i5;
import '../http/cache/cache_token_repository.dart' as _i12;
import '../http/cache/cache_validador_service.dart' as _i8;
import '../http/dio/dio_client.dart' as _i7;
import '../http/dio/exceptions.dart' as _i6;
import '../http/dio/interceptors.dart' as _i11;
import '../repositories/http_chart_data_repository.dart' as _i15;
import '../services/http_authentication_service.dart' as _i14;
import 'dependencies.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.lazySingleton<_i3.Dio>(() => dioModule.dio);
    gh.factory<_i4.IBannerService>(() => _i5.CustomBannerService());
    gh.factory<_i4.IHandlerExceptionService>(() => _i6.DioHandlerExcepton());
    gh.factory<_i4.IHttpClient>(() => _i7.DioHttpClient(gh<_i3.Dio>()));
    gh.singleton<_i4.IValidatorService>(_i8.CacheValidatorService());
    gh.factory<List<_i3.Interceptor>>(() => dioModule.interceptors);
    gh.factory<_i9.LoginCtrl>(() => _i9.LoginCtrl());
    await gh.factoryAsync<_i10.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i11.TokenInterceptor>(() => _i11.TokenInterceptor());
    gh.factory<_i4.TokenRepository>(() => _i12.CacheTokenRepository());
    gh.factory<_i11.ValidatorInterceptor>(() => _i11.ValidatorInterceptor());
    gh.lazySingleton<_i13.CacheService>(
        () => _i13.CacheServiceImpl(gh<_i10.SharedPreferences>()));
    gh.factory<_i4.IAuthenticationService>(
        () => _i14.HttpAuthenticationService(gh<_i4.IHttpClient>()));
    gh.factory<_i4.IChartDataRepository>(
        () => _i15.HttpChartDataRepository(gh<_i4.IHttpClient>()));
    gh.factory<_i4.IConsultRegisterBusinessChartUseCase>(() =>
        _i16.ConsultRegisterBusinessChartUseCase(
            gh<_i4.IChartDataRepository>()));
    gh.factory<_i4.IGetUserUseCase>(
        () => _i17.GetUserUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.ILoginUseCase>(
        () => _i17.LoginUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.ILogoutUseCase>(
        () => _i17.LogoutUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.IRefreshTokenUseCase>(
        () => _i17.RefreshTokenUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.IRegisterUseCase>(
        () => _i17.RegisterUseCase(gh<_i4.IAuthenticationService>()));
    return this;
  }
}

class _$DioModule extends _i18.DioModule {}

class _$SharedPreferencesModule extends _i18.SharedPreferencesModule {}
