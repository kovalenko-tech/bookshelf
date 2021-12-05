// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;

import '../api/api.dart' as _i10;
import '../api/auth/auth.dart' as _i15;
import '../api/book/book.dart' as _i17;
import '../bootstrap.dart' as _i14;
import '../modules/auth/modules/login/cubit/login_cubit.dart' as _i19;
import '../modules/auth/modules/register/cubit/register_cubit.dart' as _i21;
import '../modules/auth/repository/auth.dart' as _i16;
import '../modules/launch/cubit/launch_cubit.dart' as _i6;
import '../modules/main/cubit/main_cubit.dart' as _i20;
import '../modules/main/modules/details/cubit/details_cubit.dart' as _i18;
import '../modules/main/repository/main.dart' as _i9;
import '../provider/brightness_provider.dart' as _i4;
import '../repository/repository.dart' as _i7;
import '../repository/secure/secure.dart' as _i11;
import '../repository/session/model.dart' as _i12;
import '../repository/session/session.dart' as _i13;
import '../router/app_router.gr.dart' as _i3;
import 'third_party_module.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyModule = _$ThirdPartyModule();
  gh.lazySingleton<_i3.AppRouter>(() => thirdPartyModule.router);
  gh.lazySingleton<_i4.BrightnessProvider>(() => _i4.BrightnessProvider());
  await gh.factoryAsync<_i5.Dio>(() => thirdPartyModule.dio, preResolve: true);
  gh.lazySingleton<_i6.LaunchCubit>(() => _i6.LaunchCubit(
      appRouter: get<_i3.AppRouter>(),
      sessionRepository: get<_i7.SessionRepository>()));
  gh.lazySingleton<_i8.Logger>(() => thirdPartyModule.logger);
  gh.factory<_i9.MainRepository>(
      () => _i9.MainRepository(bookApi: get<_i10.BookApi>()));
  gh.lazySingleton<_i11.SecureRepository>(
      () => _i11.SecureRepository(logger: get<_i8.Logger>()));
  gh.lazySingleton<_i12.Session>(() => _i12.Session());
  gh.lazySingleton<_i13.SessionRepository>(() => _i13.SessionRepository(
      session: get<_i12.Session>(),
      logger: get<_i8.Logger>(),
      secureRepository: get<_i11.SecureRepository>()));
  gh.lazySingleton<_i14.AppBlocObserver>(
      () => _i14.AppBlocObserver(logger: get<_i8.Logger>()));
  gh.lazySingleton<_i15.AuthApi>(() => _i15.AuthApi(get<_i5.Dio>()));
  gh.factory<_i16.AuthRepository>(
      () => _i16.AuthRepository(authApi: get<_i15.AuthApi>()));
  gh.lazySingleton<_i17.BookApi>(() => _i17.BookApi(get<_i5.Dio>()));
  gh.factory<_i18.DetailsCubit>(
      () => _i18.DetailsCubit(mainRepository: get<_i9.MainRepository>()));
  gh.factory<_i19.LoginCubit>(() => _i19.LoginCubit(
      appRouter: get<_i3.AppRouter>(),
      authRepository: get<_i16.AuthRepository>(),
      sessionRepository: get<_i7.SessionRepository>()));
  gh.lazySingleton<_i20.MainCubit>(() => _i20.MainCubit(
      appRouter: get<_i3.AppRouter>(),
      mainRepository: get<_i9.MainRepository>(),
      sessionRepository: get<_i7.SessionRepository>()));
  gh.factory<_i21.RegisterCubit>(() => _i21.RegisterCubit(
      appRouter: get<_i3.AppRouter>(),
      authRepository: get<_i16.AuthRepository>(),
      sessionRepository: get<_i7.SessionRepository>()));
  return get;
}

class _$ThirdPartyModule extends _i22.ThirdPartyModule {}
