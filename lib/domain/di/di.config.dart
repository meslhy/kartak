// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i10;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i12;
import '../../data/repos/home_repo/home_repo.dart' as _i14;
import '../../data/utils/shared_utils.dart' as _i7;
import '../../shared_locale/helper.dart' as _i6;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i23;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i21;
import '../../ui/screens/auth/login/login_view_model.dart' as _i16;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i19;
import '../../ui/screens/main/main_screen_view_model.dart' as _i17;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i25;
import '../../ui/screens/payment/cash_payment/cash_payment_view_model.dart'
    as _i3;
import '../../ui/screens/payment/payment_details/payment_details_view_model.dart'
    as _i5;
import '../../ui/screens/splash/splash_view_model.dart' as _i8;
import '../repos/auth_repo/auth_repo.dart' as _i9;
import '../repos/home_repo/ds/home_online_ds.dart' as _i11;
import '../repos/home_repo/home_repo.dart' as _i13;
import '../use_cases/get_places_use_case.dart' as _i24;
import '../use_cases/login_use_case.dart' as _i15;
import '../use_cases/register_use_case.dart' as _i18;
import '../use_cases/send_otp_use_case.dart' as _i20;
import '../use_cases/verification_otp_use_case.dart' as _i22;
import 'app_module.dart' as _i26;

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
    gh.factory<_i3.CashPaymentViewModel>(() => _i3.CashPaymentViewModel());
    gh.factory<_i4.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i5.PaymentDetailsViewModel>(
        () => _i5.PaymentDetailsViewModel());
    gh.factory<_i6.SharedPreferenceGlobal>(() => _i6.SharedPreferenceGlobal());
    gh.factory<_i7.SharedPrefsUtils>(() => _i7.SharedPrefsUtils());
    gh.factory<_i8.SplashViewModel>(() => _i8.SplashViewModel());
    gh.factory<_i9.AuthRepo>(() => _i10.AuthRepoImpl(
          gh<_i4.Connectivity>(),
          gh<_i7.SharedPrefsUtils>(),
        ));
    gh.factory<_i11.HomeOnlineDS>(
        () => _i12.HomeOnlineDSImpl(gh<_i7.SharedPrefsUtils>()));
    gh.factory<_i13.HomeRepo>(() => _i14.HomeRepoImpl(
          gh<_i11.HomeOnlineDS>(),
          gh<_i4.Connectivity>(),
        ));
    gh.factory<_i15.LoginUseCase>(() => _i15.LoginUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i16.LoginViewModel>(
        () => _i16.LoginViewModel(gh<_i15.LoginUseCase>()));
    gh.factory<_i17.MainViewModel>(
        () => _i17.MainViewModel(gh<_i6.SharedPreferenceGlobal>()));
    gh.factory<_i18.RegisterUseCase>(
        () => _i18.RegisterUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i19.RegisterViewModel>(
        () => _i19.RegisterViewModel(gh<_i18.RegisterUseCase>()));
    gh.factory<_i20.SendOTPUseCase>(
        () => _i20.SendOTPUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i21.SendOTPViewModel>(
        () => _i21.SendOTPViewModel(gh<_i20.SendOTPUseCase>()));
    gh.factory<_i22.VerificationOTPUseCase>(
        () => _i22.VerificationOTPUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i23.VerificationOTPViewModel>(
        () => _i23.VerificationOTPViewModel(gh<_i22.VerificationOTPUseCase>()));
    gh.factory<_i24.GetPlacesUseCase>(
        () => _i24.GetPlacesUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i25.HomeViewModel>(
        () => _i25.HomeViewModel(gh<_i24.GetPlacesUseCase>()));
    return this;
  }
}

class _$AppModule extends _i26.AppModule {}
