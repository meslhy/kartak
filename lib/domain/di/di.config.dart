// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i8;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i10;
import '../../data/repos/home_repo/home_repo.dart' as _i12;
import '../../data/utils/shared_utils.dart' as _i5;
import '../../shared_locale/helper.dart' as _i4;
import '../../ui/screens/auth/login/login_view_model.dart' as _i14;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i17;
import '../../ui/screens/main/main_screen_view_model.dart' as _i15;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i19;
import '../../ui/screens/splash/splash_view_model.dart' as _i6;
import '../repos/auth_repo/auth_repo.dart' as _i7;
import '../repos/home_repo/ds/home_online_ds.dart' as _i9;
import '../repos/home_repo/home_repo.dart' as _i11;
import '../use_cases/get_places_use_case.dart' as _i18;
import '../use_cases/login_use_case.dart' as _i13;
import '../use_cases/register_use_case.dart' as _i16;
import 'app_module.dart' as _i20;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i4.SharedPreferenceGlobal>(() => _i4.SharedPreferenceGlobal());
    gh.factory<_i5.SharedPrefsUtils>(() => _i5.SharedPrefsUtils());
    gh.factory<_i6.SplashViewModel>(() => _i6.SplashViewModel());
    gh.factory<_i7.AuthRepo>(() => _i8.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i5.SharedPrefsUtils>(),
        ));
    gh.factory<_i9.HomeOnlineDS>(
        () => _i10.HomeOnlineDSImpl(gh<_i5.SharedPrefsUtils>()));
    gh.factory<_i11.HomeRepo>(() => _i12.HomeRepoImpl(
          gh<_i9.HomeOnlineDS>(),
          gh<_i3.Connectivity>(),
        ));
    gh.factory<_i13.LoginUseCase>(() => _i13.LoginUseCase(gh<_i7.AuthRepo>()));
    gh.factory<_i14.LoginViewModel>(
        () => _i14.LoginViewModel(gh<_i13.LoginUseCase>()));
    gh.factory<_i15.MainViewModel>(
        () => _i15.MainViewModel(gh<_i4.SharedPreferenceGlobal>()));
    gh.factory<_i16.RegisterUseCase>(
        () => _i16.RegisterUseCase(gh<_i7.AuthRepo>()));
    gh.factory<_i17.RegisterViewModel>(
        () => _i17.RegisterViewModel(gh<_i16.RegisterUseCase>()));
    gh.factory<_i18.GetPlacesUseCase>(
        () => _i18.GetPlacesUseCase(gh<_i11.HomeRepo>()));
    gh.factory<_i19.HomeViewModel>(
        () => _i19.HomeViewModel(gh<_i18.GetPlacesUseCase>()));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}
