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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i22;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i27;
import '../../data/repos/home_repo/home_repo.dart' as _i29;
import '../../data/repos/payment/ds/payment_online_ds.dart' as _i6;
import '../../data/repos/payment/payment_repo.dart' as _i8;
import '../../data/repos/profile/ds/profile_online_ds.dart' as _i11;
import '../../data/repos/profile/profile_repo.dart' as _i13;
import '../../data/repos/transactions/ds/transactions_online_ds.dart' as _i18;
import '../../data/repos/transactions/transactions_repo.dart' as _i20;
import '../../data/utils/shared_utils.dart' as _i15;
import '../../shared_locale/helper.dart' as _i14;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i39;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i36;
import '../../ui/screens/auth/login/login_view_model.dart' as _i31;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i34;
import '../../ui/screens/main/main_screen_view_model.dart' as _i44;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i43;
import '../../ui/screens/main/tabs/home/place_details/place_details_view_model.dart'
    as _i45;
import '../../ui/screens/main/tabs/profile/profile_view_model.dart' as _i46;
import '../../ui/screens/main/tabs/transaction/transactions_view_model.dart'
    as _i37;
import '../../ui/screens/payment/cash_payment/cash_payment_view_model.dart'
    as _i40;
import '../../ui/screens/payment/payment_details/payment_details_view_model.dart'
    as _i4;
import '../../ui/screens/splash/splash_view_model.dart' as _i16;
import '../repos/auth_repo/auth_repo.dart' as _i21;
import '../repos/home_repo/ds/home_online_ds.dart' as _i26;
import '../repos/home_repo/home_repo.dart' as _i28;
import '../repos/payment/ds/payment_online_ds.dart' as _i5;
import '../repos/payment/payment_repo.dart' as _i7;
import '../repos/profile/ds/profile_online_ds.dart' as _i10;
import '../repos/profile/profile_repo.dart' as _i12;
import '../repos/transactions/ds/transactions_online_ds.dart' as _i17;
import '../repos/transactions/transactions_repo.dart' as _i19;
import '../use_cases/get_places_use_case.dart' as _i41;
import '../use_cases/get_profile_use_case.dart' as _i23;
import '../use_cases/get_specific_place_use_case.dart' as _i42;
import '../use_cases/get_transactions_use_case.dart' as _i24;
import '../use_cases/get_users_use_case.dart' as _i25;
import '../use_cases/login_use_case.dart' as _i30;
import '../use_cases/payment_cash_use_case.dart' as _i32;
import '../use_cases/payment_use_case.dart' as _i9;
import '../use_cases/register_use_case.dart' as _i33;
import '../use_cases/send_otp_use_case.dart' as _i35;
import '../use_cases/verification_otp_use_case.dart' as _i38;
import 'app_module.dart' as _i47;

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
    gh.factory<_i4.PaymentDetailsViewModel>(
        () => _i4.PaymentDetailsViewModel());
    gh.factory<_i5.PaymentOnlineDS>(() => _i6.PaymentOnlineDSImpl());
    gh.factory<_i7.PaymentRepo>(() => _i8.PaymentRepoImpl(
          gh<_i5.PaymentOnlineDS>(),
          gh<_i3.Connectivity>(),
        ));
    gh.factory<_i9.PaymentUseCase>(
        () => _i9.PaymentUseCase(gh<_i7.PaymentRepo>()));
    gh.factory<_i10.ProfileOnlineDS>(() => _i11.ProfileOnlineDSImpl());
    gh.factory<_i12.ProfileRepo>(() => _i13.ProfileRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i10.ProfileOnlineDS>(),
        ));
    gh.factory<_i14.SharedPreferenceGlobal>(
        () => _i14.SharedPreferenceGlobal());
    gh.factory<_i15.SharedPrefsUtils>(() => _i15.SharedPrefsUtils());
    gh.factory<_i16.SplashViewModel>(() => _i16.SplashViewModel());
    gh.factory<_i17.TransactionsOnlineDS>(
        () => _i18.TransactionsOnlineDSImpl());
    gh.factory<_i19.TransactionsRepo>(() => _i20.TransactionsRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i17.TransactionsOnlineDS>(),
        ));
    gh.factory<_i21.AuthRepo>(() => _i22.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i15.SharedPrefsUtils>(),
        ));
    gh.factory<_i23.GetProfileUseCase>(
        () => _i23.GetProfileUseCase(gh<_i12.ProfileRepo>()));
    gh.factory<_i24.GetTransactionsUseCase>(
        () => _i24.GetTransactionsUseCase(gh<_i19.TransactionsRepo>()));
    gh.factory<_i25.GetUsersUseCase>(
        () => _i25.GetUsersUseCase(gh<_i12.ProfileRepo>()));
    gh.factory<_i26.HomeOnlineDS>(
        () => _i27.HomeOnlineDSImpl(gh<_i15.SharedPrefsUtils>()));
    gh.factory<_i28.HomeRepo>(() => _i29.HomeRepoImpl(
          gh<_i26.HomeOnlineDS>(),
          gh<_i3.Connectivity>(),
        ));
    gh.factory<_i30.LoginUseCase>(() => _i30.LoginUseCase(gh<_i21.AuthRepo>()));
    gh.factory<_i31.LoginViewModel>(
        () => _i31.LoginViewModel(gh<_i30.LoginUseCase>()));
    gh.factory<_i32.PaymentCashUseCase>(
        () => _i32.PaymentCashUseCase(gh<_i7.PaymentRepo>()));
    gh.factory<_i33.RegisterUseCase>(
        () => _i33.RegisterUseCase(gh<_i21.AuthRepo>()));
    gh.factory<_i34.RegisterViewModel>(
        () => _i34.RegisterViewModel(gh<_i33.RegisterUseCase>()));
    gh.factory<_i35.SendOTPUseCase>(
        () => _i35.SendOTPUseCase(gh<_i21.AuthRepo>()));
    gh.factory<_i36.SendOTPViewModel>(
        () => _i36.SendOTPViewModel(gh<_i35.SendOTPUseCase>()));
    gh.factory<_i37.TransactionsViewModel>(() => _i37.TransactionsViewModel(
          gh<_i24.GetTransactionsUseCase>(),
          gh<_i23.GetProfileUseCase>(),
        ));
    gh.factory<_i38.VerificationOTPUseCase>(
        () => _i38.VerificationOTPUseCase(gh<_i21.AuthRepo>()));
    gh.factory<_i39.VerificationOTPViewModel>(
        () => _i39.VerificationOTPViewModel(gh<_i38.VerificationOTPUseCase>()));
    gh.factory<_i40.CashPaymentViewModel>(
        () => _i40.CashPaymentViewModel(gh<_i32.PaymentCashUseCase>()));
    gh.factory<_i41.GetPlacesUseCase>(
        () => _i41.GetPlacesUseCase(gh<_i28.HomeRepo>()));
    gh.factory<_i42.GetSpecificPlacesUseCase>(
        () => _i42.GetSpecificPlacesUseCase(gh<_i28.HomeRepo>()));
    gh.factory<_i43.HomeViewModel>(
        () => _i43.HomeViewModel(gh<_i41.GetPlacesUseCase>()));
    gh.factory<_i44.MainViewModel>(() => _i44.MainViewModel(
          gh<_i14.SharedPreferenceGlobal>(),
          gh<_i9.PaymentUseCase>(),
          gh<_i41.GetPlacesUseCase>(),
        ));
    gh.factory<_i45.PlaceDetailsViewModel>(
        () => _i45.PlaceDetailsViewModel(gh<_i42.GetSpecificPlacesUseCase>()));
    gh.factory<_i46.ProfileViewModel>(() => _i46.ProfileViewModel(
          gh<_i15.SharedPrefsUtils>(),
          gh<_i23.GetProfileUseCase>(),
          gh<_i41.GetPlacesUseCase>(),
          gh<_i25.GetUsersUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i47.AppModule {}
