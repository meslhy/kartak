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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i23;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i28;
import '../../data/repos/home_repo/home_repo.dart' as _i30;
import '../../data/repos/payment/ds/payment_online_ds.dart' as _i7;
import '../../data/repos/payment/payment_repo.dart' as _i9;
import '../../data/repos/profile/ds/profile_online_ds.dart' as _i12;
import '../../data/repos/profile/profile_repo.dart' as _i14;
import '../../data/repos/transactions/ds/transactions_online_ds.dart' as _i19;
import '../../data/repos/transactions/transactions_repo.dart' as _i21;
import '../../data/utils/shared_utils.dart' as _i16;
import '../../shared_locale/helper.dart' as _i15;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i40;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i37;
import '../../ui/screens/auth/login/login_view_model.dart' as _i32;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i35;
import '../../ui/screens/main/main_screen_view_model.dart' as _i33;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i43;
import '../../ui/screens/main/tabs/home/place_details/place_details_view_model.dart'
    as _i44;
import '../../ui/screens/main/tabs/profile/profile_view_model.dart' as _i45;
import '../../ui/screens/main/tabs/transaction/transactions_view_model.dart'
    as _i38;
import '../../ui/screens/payment/cash_payment/cash_payment_view_model.dart'
    as _i3;
import '../../ui/screens/payment/payment_details/payment_details_view_model.dart'
    as _i5;
import '../../ui/screens/splash/splash_view_model.dart' as _i17;
import '../repos/auth_repo/auth_repo.dart' as _i22;
import '../repos/home_repo/ds/home_online_ds.dart' as _i27;
import '../repos/home_repo/home_repo.dart' as _i29;
import '../repos/payment/ds/payment_online_ds.dart' as _i6;
import '../repos/payment/payment_repo.dart' as _i8;
import '../repos/profile/ds/profile_online_ds.dart' as _i11;
import '../repos/profile/profile_repo.dart' as _i13;
import '../repos/transactions/ds/transactions_online_ds.dart' as _i18;
import '../repos/transactions/transactions_repo.dart' as _i20;
import '../use_cases/get_places_use_case.dart' as _i41;
import '../use_cases/get_profile_use_case.dart' as _i24;
import '../use_cases/get_specific_place_use_case.dart' as _i42;
import '../use_cases/get_transactions_use_case.dart' as _i25;
import '../use_cases/get_users_use_case.dart' as _i26;
import '../use_cases/login_use_case.dart' as _i31;
import '../use_cases/payment_use_case.dart' as _i10;
import '../use_cases/register_use_case.dart' as _i34;
import '../use_cases/send_otp_use_case.dart' as _i36;
import '../use_cases/verification_otp_use_case.dart' as _i39;
import 'app_module.dart' as _i46;

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
    gh.factory<_i6.PaymentOnlineDS>(() => _i7.PaymentOnlineDSImpl());
    gh.factory<_i8.PaymentRepo>(() => _i9.PaymentRepoImpl(
          gh<_i6.PaymentOnlineDS>(),
          gh<_i4.Connectivity>(),
        ));
    gh.factory<_i10.PaymentUseCase>(
        () => _i10.PaymentUseCase(gh<_i8.PaymentRepo>()));
    gh.factory<_i11.ProfileOnlineDS>(() => _i12.ProfileOnlineDSImpl());
    gh.factory<_i13.ProfileRepo>(() => _i14.ProfileRepoImpl(
          gh<_i4.Connectivity>(),
          gh<_i11.ProfileOnlineDS>(),
        ));
    gh.factory<_i15.SharedPreferenceGlobal>(
        () => _i15.SharedPreferenceGlobal());
    gh.factory<_i16.SharedPrefsUtils>(() => _i16.SharedPrefsUtils());
    gh.factory<_i17.SplashViewModel>(() => _i17.SplashViewModel());
    gh.factory<_i18.TransactionsOnlineDS>(
        () => _i19.TransactionsOnlineDSImpl());
    gh.factory<_i20.TransactionsRepo>(() => _i21.TransactionsRepoImpl(
          gh<_i4.Connectivity>(),
          gh<_i18.TransactionsOnlineDS>(),
        ));
    gh.factory<_i22.AuthRepo>(() => _i23.AuthRepoImpl(
          gh<_i4.Connectivity>(),
          gh<_i16.SharedPrefsUtils>(),
        ));
    gh.factory<_i24.GetProfileUseCase>(
        () => _i24.GetProfileUseCase(gh<_i13.ProfileRepo>()));
    gh.factory<_i25.GetTransactionsUseCase>(
        () => _i25.GetTransactionsUseCase(gh<_i20.TransactionsRepo>()));
    gh.factory<_i26.GetUsersUseCase>(
        () => _i26.GetUsersUseCase(gh<_i13.ProfileRepo>()));
    gh.factory<_i27.HomeOnlineDS>(
        () => _i28.HomeOnlineDSImpl(gh<_i16.SharedPrefsUtils>()));
    gh.factory<_i29.HomeRepo>(() => _i30.HomeRepoImpl(
          gh<_i27.HomeOnlineDS>(),
          gh<_i4.Connectivity>(),
        ));
    gh.factory<_i31.LoginUseCase>(() => _i31.LoginUseCase(gh<_i22.AuthRepo>()));
    gh.factory<_i32.LoginViewModel>(
        () => _i32.LoginViewModel(gh<_i31.LoginUseCase>()));
    gh.factory<_i33.MainViewModel>(() => _i33.MainViewModel(
          gh<_i15.SharedPreferenceGlobal>(),
          gh<_i10.PaymentUseCase>(),
        ));
    gh.factory<_i34.RegisterUseCase>(
        () => _i34.RegisterUseCase(gh<_i22.AuthRepo>()));
    gh.factory<_i35.RegisterViewModel>(
        () => _i35.RegisterViewModel(gh<_i34.RegisterUseCase>()));
    gh.factory<_i36.SendOTPUseCase>(
        () => _i36.SendOTPUseCase(gh<_i22.AuthRepo>()));
    gh.factory<_i37.SendOTPViewModel>(
        () => _i37.SendOTPViewModel(gh<_i36.SendOTPUseCase>()));
    gh.factory<_i38.TransactionsViewModel>(
        () => _i38.TransactionsViewModel(gh<_i25.GetTransactionsUseCase>()));
    gh.factory<_i39.VerificationOTPUseCase>(
        () => _i39.VerificationOTPUseCase(gh<_i22.AuthRepo>()));
    gh.factory<_i40.VerificationOTPViewModel>(
        () => _i40.VerificationOTPViewModel(gh<_i39.VerificationOTPUseCase>()));
    gh.factory<_i41.GetPlacesUseCase>(
        () => _i41.GetPlacesUseCase(gh<_i29.HomeRepo>()));
    gh.factory<_i42.GetSpecificPlacesUseCase>(
        () => _i42.GetSpecificPlacesUseCase(gh<_i29.HomeRepo>()));
    gh.factory<_i43.HomeViewModel>(
        () => _i43.HomeViewModel(gh<_i41.GetPlacesUseCase>()));
    gh.factory<_i44.PlaceDetailsViewModel>(
        () => _i44.PlaceDetailsViewModel(gh<_i42.GetSpecificPlacesUseCase>()));
    gh.factory<_i45.ProfileViewModel>(() => _i45.ProfileViewModel(
          gh<_i16.SharedPrefsUtils>(),
          gh<_i24.GetProfileUseCase>(),
          gh<_i41.GetPlacesUseCase>(),
          gh<_i26.GetUsersUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i46.AppModule {}
