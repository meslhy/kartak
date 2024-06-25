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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i19;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i22;
import '../../data/repos/home_repo/home_repo.dart' as _i24;
import '../../data/repos/payment/ds/payment_online_ds.dart' as _i7;
import '../../data/repos/payment/payment_repo.dart' as _i9;
import '../../data/repos/transactions/ds/transactions_online_ds.dart' as _i15;
import '../../data/repos/transactions/transactions_repo.dart' as _i17;
import '../../data/utils/shared_utils.dart' as _i12;
import '../../shared_locale/helper.dart' as _i11;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i34;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i31;
import '../../ui/screens/auth/login/login_view_model.dart' as _i26;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i29;
import '../../ui/screens/main/main_screen_view_model.dart' as _i27;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i37;
import '../../ui/screens/main/tabs/home/place_details/place_details_view_model.dart'
    as _i38;
import '../../ui/screens/main/tabs/transaction/transactions_view_model.dart'
    as _i32;
import '../../ui/screens/payment/cash_payment/cash_payment_view_model.dart'
    as _i3;
import '../../ui/screens/payment/payment_details/payment_details_view_model.dart'
    as _i5;
import '../../ui/screens/splash/splash_view_model.dart' as _i13;
import '../repos/auth_repo/auth_repo.dart' as _i18;
import '../repos/home_repo/ds/home_online_ds.dart' as _i21;
import '../repos/home_repo/home_repo.dart' as _i23;
import '../repos/payment/ds/payment_online_ds.dart' as _i6;
import '../repos/payment/payment_repo.dart' as _i8;
import '../repos/transactions/ds/transactions_online_ds.dart' as _i14;
import '../repos/transactions/transactions_repo.dart' as _i16;
import '../use_cases/get_places_use_case.dart' as _i35;
import '../use_cases/get_specific_place_use_case.dart' as _i36;
import '../use_cases/get_transactions_use_case.dart' as _i20;
import '../use_cases/login_use_case.dart' as _i25;
import '../use_cases/payment_use_case.dart' as _i10;
import '../use_cases/register_use_case.dart' as _i28;
import '../use_cases/send_otp_use_case.dart' as _i30;
import '../use_cases/verification_otp_use_case.dart' as _i33;
import 'app_module.dart' as _i39;

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
    gh.factory<_i11.SharedPreferenceGlobal>(
        () => _i11.SharedPreferenceGlobal());
    gh.factory<_i12.SharedPrefsUtils>(() => _i12.SharedPrefsUtils());
    gh.factory<_i13.SplashViewModel>(() => _i13.SplashViewModel());
    gh.factory<_i14.TransactionsOnlineDS>(
        () => _i15.TransactionsOnlineDSImpl());
    gh.factory<_i16.TransactionsRepo>(() => _i17.TransactionsRepoImpl(
          gh<_i4.Connectivity>(),
          gh<_i14.TransactionsOnlineDS>(),
        ));
    gh.factory<_i18.AuthRepo>(() => _i19.AuthRepoImpl(
          gh<_i4.Connectivity>(),
          gh<_i12.SharedPrefsUtils>(),
        ));
    gh.factory<_i20.GetTransactionsUseCase>(
        () => _i20.GetTransactionsUseCase(gh<_i16.TransactionsRepo>()));
    gh.factory<_i21.HomeOnlineDS>(
        () => _i22.HomeOnlineDSImpl(gh<_i12.SharedPrefsUtils>()));
    gh.factory<_i23.HomeRepo>(() => _i24.HomeRepoImpl(
          gh<_i21.HomeOnlineDS>(),
          gh<_i4.Connectivity>(),
        ));
    gh.factory<_i25.LoginUseCase>(() => _i25.LoginUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i26.LoginViewModel>(
        () => _i26.LoginViewModel(gh<_i25.LoginUseCase>()));
    gh.factory<_i27.MainViewModel>(() => _i27.MainViewModel(
          gh<_i11.SharedPreferenceGlobal>(),
          gh<_i10.PaymentUseCase>(),
        ));
    gh.factory<_i28.RegisterUseCase>(
        () => _i28.RegisterUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i29.RegisterViewModel>(
        () => _i29.RegisterViewModel(gh<_i28.RegisterUseCase>()));
    gh.factory<_i30.SendOTPUseCase>(
        () => _i30.SendOTPUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i31.SendOTPViewModel>(
        () => _i31.SendOTPViewModel(gh<_i30.SendOTPUseCase>()));
    gh.factory<_i32.TransactionsViewModel>(
        () => _i32.TransactionsViewModel(gh<_i20.GetTransactionsUseCase>()));
    gh.factory<_i33.VerificationOTPUseCase>(
        () => _i33.VerificationOTPUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i34.VerificationOTPViewModel>(
        () => _i34.VerificationOTPViewModel(gh<_i33.VerificationOTPUseCase>()));
    gh.factory<_i35.GetPlacesUseCase>(
        () => _i35.GetPlacesUseCase(gh<_i23.HomeRepo>()));
    gh.factory<_i36.GetSpecificPlacesUseCase>(
        () => _i36.GetSpecificPlacesUseCase(gh<_i23.HomeRepo>()));
    gh.factory<_i37.HomeViewModel>(
        () => _i37.HomeViewModel(gh<_i35.GetPlacesUseCase>()));
    gh.factory<_i38.PlaceDetailsViewModel>(
        () => _i38.PlaceDetailsViewModel(gh<_i36.GetSpecificPlacesUseCase>()));
    return this;
  }
}

class _$AppModule extends _i39.AppModule {}
