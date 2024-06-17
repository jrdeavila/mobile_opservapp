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
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../../lib.dart' as _i5;
import '../../application/use_cases/authentication_use_case.dart' as _i18;
import '../../application/use_cases/section_use_case.dart' as _i17;
import '../../presentation/features/authentication/controllers/authentication_controller.dart'
    as _i12;
import '../cache/cache_service.dart' as _i15;
import '../http/banner/custom_banner_service.dart' as _i6;
import '../http/cache/cache_token_repository.dart' as _i14;
import '../http/cache/cache_validador_service.dart' as _i11;
import '../http/dio/dio_client.dart' as _i8;
import '../http/dio/exceptions.dart' as _i7;
import '../http/dio/interceptors.dart' as _i4;
import '../repositories/http_section_repository.dart' as _i9;
import '../services/http_authentication_service.dart' as _i16;
import '../services/url_launcher_section_dashboard_service.dart' as _i19;
import '../url_launcher/url_launcher.dart' as _i10;
import 'dependencies.dart' as _i20;

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
    gh.factory<_i4.DioTokenInterceptor>(() => _i4.DioTokenInterceptor());
    gh.factory<_i4.DioValidatorInterceptor>(
        () => _i4.DioValidatorInterceptor());
    gh.factory<_i5.IBannerService>(() => _i6.CustomBannerService());
    gh.factory<_i5.IHandlerExceptionService>(() => _i7.DioHandlerExcepton());
    gh.factory<_i5.IHttpClient>(() => _i8.DioHttpClient(gh<_i3.Dio>()));
    gh.factory<_i5.ISectionDataRepository>(
        () => _i9.HttpSectionRespository(gh<_i5.IHttpClient>()));
    gh.factory<_i5.IUrlLauncher>(() => _i10.UrlLauncherImpl());
    gh.singleton<_i5.IValidatorService>(_i11.CacheValidatorService());
    gh.factory<List<_i3.Interceptor>>(() => dioModule.interceptors);
    gh.factory<_i12.LoginCtrl>(() => _i12.LoginCtrl());
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i5.TokenRepository>(() => _i14.CacheTokenRepository());
    gh.lazySingleton<_i15.CacheService>(
        () => _i15.CacheServiceImpl(gh<_i13.SharedPreferences>()));
    gh.factory<_i5.IAuthenticationService>(
        () => _i16.HttpAuthenticationService(gh<_i5.IHttpClient>()));
    gh.factory<_i5.IConsultExtendedSectionUseCase>(() =>
        _i17.ConsultExtendedSectionUseCase(gh<_i5.ISectionDataRepository>()));
    gh.factory<_i5.IConsultSectionsUseCase>(
        () => _i17.ConsultSectionUseCase(gh<_i5.ISectionDataRepository>()));
    gh.factory<_i5.IGetUserUseCase>(
        () => _i18.GetUserUseCase(gh<_i5.IAuthenticationService>()));
    gh.factory<_i5.ILoginUseCase>(
        () => _i18.LoginUseCase(gh<_i5.IAuthenticationService>()));
    gh.factory<_i5.ILogoutUseCase>(
        () => _i18.LogoutUseCase(gh<_i5.IAuthenticationService>()));
    gh.factory<_i5.IRefreshTokenUseCase>(
        () => _i18.RefreshTokenUseCase(gh<_i5.IAuthenticationService>()));
    gh.factory<_i5.IRegisterUseCase>(
        () => _i18.RegisterUseCase(gh<_i5.IAuthenticationService>()));
    gh.factory<_i5.ISectionDashboardService>(
        () => _i19.UrlLauncherSectionDashboardService(gh<_i5.IUrlLauncher>()));
    gh.factory<_i5.INavigateToDashboardUseCase>(() =>
        _i17.NavigateToDashboardUseCase(gh<_i5.ISectionDashboardService>()));
    return this;
  }
}

class _$DioModule extends _i20.DioModule {}

class _$SharedPreferencesModule extends _i20.SharedPreferencesModule {}
