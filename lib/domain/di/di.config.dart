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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i9;
import '../../data/utils/shared_utils.dart' as _i6;
import '../../shared_locale/helper.dart' as _i5;
import '../../ui/screens/auth/login/login_view_model.dart' as _i11;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i14;
import '../../ui/screens/main/main_screen_view_model.dart' as _i12;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i4;
import '../../ui/screens/splash/splash_view_model.dart' as _i7;
import '../repos/auth_repo/auth_repo.dart' as _i8;
import '../use_cases/login_use_case.dart' as _i10;
import '../use_cases/register_use_case.dart' as _i13;
import 'app_module.dart' as _i15;

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
    gh.factory<_i4.HomeViewModel>(() => _i4.HomeViewModel());
    gh.factory<_i5.SharedPreferenceGlobal>(() => _i5.SharedPreferenceGlobal());
    gh.factory<_i6.SharedPrefsUtils>(() => _i6.SharedPrefsUtils());
    gh.factory<_i7.SplashViewModel>(() => _i7.SplashViewModel());
    gh.factory<_i8.AuthRepo>(() => _i9.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i6.SharedPrefsUtils>(),
        ));
    gh.factory<_i10.LoginUseCase>(() => _i10.LoginUseCase(gh<_i8.AuthRepo>()));
    gh.factory<_i11.LoginViewModel>(
        () => _i11.LoginViewModel(gh<_i10.LoginUseCase>()));
    gh.factory<_i12.MainViewModel>(
        () => _i12.MainViewModel(gh<_i5.SharedPreferenceGlobal>()));
    gh.factory<_i13.RegisterUseCase>(
        () => _i13.RegisterUseCase(gh<_i8.AuthRepo>()));
    gh.factory<_i14.RegisterViewModel>(
        () => _i14.RegisterViewModel(gh<_i13.RegisterUseCase>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
