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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i19;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i22;
import '../../data/repos/home_repo/home_repo.dart' as _i24;
import '../../data/repos/payment/ds/payment_online_ds.dart' as _i6;
import '../../data/repos/payment/payment_repo.dart' as _i8;
import '../../data/repos/profile/ds/profile_online_ds.dart' as _i29;
import '../../data/repos/profile/profile_repo.dart' as _i31;
import '../../data/repos/transactions/ds/transactions_online_ds.dart' as _i15;
import '../../data/repos/transactions/transactions_repo.dart' as _i17;
import '../../data/utils/shared_utils.dart' as _i12;
import '../../shared_locale/helper.dart' as _i11;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i38;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i35;
import '../../ui/screens/auth/login/login_view_model.dart' as _i26;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i33;
import '../../ui/screens/main/main_screen_view_model.dart' as _i47;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i46;
import '../../ui/screens/main/tabs/home/place_details/place_details_view_model.dart'
    as _i48;
import '../../ui/screens/main/tabs/profile/profile_view_model.dart' as _i50;
import '../../ui/screens/main/tabs/profile/update_picture/update_picture_view_model.dart'
    as _i52;
import '../../ui/screens/main/tabs/scan_qr/profile_from_qr/profile_view_model.dart'
    as _i49;
import '../../ui/screens/main/tabs/scan_qr/scan_qr_view_model.dart' as _i10;
import '../../ui/screens/main/tabs/transaction/transactions_view_model.dart'
    as _i51;
import '../../ui/screens/payment/cash_payment/cash_payment_view_model.dart'
    as _i39;
import '../../ui/screens/payment/payment_details/payment_details_view_model.dart'
    as _i4;
import '../../ui/screens/splash/splash_view_model.dart' as _i13;
import '../repos/auth_repo/auth_repo.dart' as _i18;
import '../repos/home_repo/ds/home_online_ds.dart' as _i21;
import '../repos/home_repo/home_repo.dart' as _i23;
import '../repos/payment/ds/payment_online_ds.dart' as _i5;
import '../repos/payment/payment_repo.dart' as _i7;
import '../repos/profile/ds/profile_online_ds.dart' as _i28;
import '../repos/profile/profile_repo.dart' as _i30;
import '../repos/transactions/ds/transactions_online_ds.dart' as _i14;
import '../repos/transactions/transactions_repo.dart' as _i16;
import '../use_cases/create_comment_and_rate_use_case.dart' as _i40;
import '../use_cases/get_places_use_case.dart' as _i41;
import '../use_cases/get_profile_use_case.dart' as _i42;
import '../use_cases/get_specific_place_use_case.dart' as _i43;
import '../use_cases/get_specific_user_use_case.dart' as _i44;
import '../use_cases/get_transactions_use_case.dart' as _i20;
import '../use_cases/get_users_use_case.dart' as _i45;
import '../use_cases/login_use_case.dart' as _i25;
import '../use_cases/payment_cash_use_case.dart' as _i27;
import '../use_cases/payment_use_case.dart' as _i9;
import '../use_cases/register_use_case.dart' as _i32;
import '../use_cases/send_otp_use_case.dart' as _i34;
import '../use_cases/update_photo_use_case.dart' as _i36;
import '../use_cases/verification_otp_use_case.dart' as _i37;
import 'app_module.dart' as _i53;

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
    gh.factory<_i10.ScanQRViewModel>(() => _i10.ScanQRViewModel());
    gh.factory<_i11.SharedPreferenceGlobal>(
        () => _i11.SharedPreferenceGlobal());
    gh.factory<_i12.SharedPrefsUtils>(() => _i12.SharedPrefsUtils());
    gh.factory<_i13.SplashViewModel>(() => _i13.SplashViewModel());
    gh.factory<_i14.TransactionsOnlineDS>(
        () => _i15.TransactionsOnlineDSImpl());
    gh.factory<_i16.TransactionsRepo>(() => _i17.TransactionsRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i14.TransactionsOnlineDS>(),
        ));
    gh.factory<_i18.AuthRepo>(() => _i19.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i12.SharedPrefsUtils>(),
        ));
    gh.factory<_i20.GetTransactionsUseCase>(
        () => _i20.GetTransactionsUseCase(gh<_i16.TransactionsRepo>()));
    gh.factory<_i21.HomeOnlineDS>(() => _i22.HomeOnlineDSImpl(
          gh<_i12.SharedPrefsUtils>(),
          gh<_i11.SharedPreferenceGlobal>(),
        ));
    gh.factory<_i23.HomeRepo>(() => _i24.HomeRepoImpl(
          gh<_i21.HomeOnlineDS>(),
          gh<_i3.Connectivity>(),
        ));
    gh.factory<_i25.LoginUseCase>(() => _i25.LoginUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i26.LoginViewModel>(
        () => _i26.LoginViewModel(gh<_i25.LoginUseCase>()));
    gh.factory<_i27.PaymentCashUseCase>(
        () => _i27.PaymentCashUseCase(gh<_i7.PaymentRepo>()));
    gh.factory<_i28.ProfileOnlineDS>(
        () => _i29.ProfileOnlineDSImpl(gh<_i12.SharedPrefsUtils>()));
    gh.factory<_i30.ProfileRepo>(() => _i31.ProfileRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i28.ProfileOnlineDS>(),
        ));
    gh.factory<_i32.RegisterUseCase>(
        () => _i32.RegisterUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i33.RegisterViewModel>(
        () => _i33.RegisterViewModel(gh<_i32.RegisterUseCase>()));
    gh.factory<_i34.SendOTPUseCase>(
        () => _i34.SendOTPUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i35.SendOTPViewModel>(
        () => _i35.SendOTPViewModel(gh<_i34.SendOTPUseCase>()));
    gh.factory<_i36.UpdatePhotoUseCase>(
        () => _i36.UpdatePhotoUseCase(gh<_i30.ProfileRepo>()));
    gh.factory<_i37.VerificationOTPUseCase>(
        () => _i37.VerificationOTPUseCase(gh<_i18.AuthRepo>()));
    gh.factory<_i38.VerificationOTPViewModel>(
        () => _i38.VerificationOTPViewModel(gh<_i37.VerificationOTPUseCase>()));
    gh.factory<_i39.CashPaymentViewModel>(
        () => _i39.CashPaymentViewModel(gh<_i27.PaymentCashUseCase>()));
    gh.factory<_i40.CreateCommentAndRateUseCase>(
        () => _i40.CreateCommentAndRateUseCase(gh<_i23.HomeRepo>()));
    gh.factory<_i41.GetPlacesUseCase>(
        () => _i41.GetPlacesUseCase(gh<_i23.HomeRepo>()));
    gh.factory<_i42.GetProfileUseCase>(
        () => _i42.GetProfileUseCase(gh<_i30.ProfileRepo>()));
    gh.factory<_i43.GetSpecificPlacesUseCase>(
        () => _i43.GetSpecificPlacesUseCase(gh<_i23.HomeRepo>()));
    gh.factory<_i44.GetSpecificUserUseCase>(
        () => _i44.GetSpecificUserUseCase(gh<_i30.ProfileRepo>()));
    gh.factory<_i45.GetUsersUseCase>(
        () => _i45.GetUsersUseCase(gh<_i30.ProfileRepo>()));
    gh.factory<_i46.HomeViewModel>(
        () => _i46.HomeViewModel(gh<_i41.GetPlacesUseCase>()));
    gh.factory<_i47.MainViewModel>(() => _i47.MainViewModel(
          gh<_i11.SharedPreferenceGlobal>(),
          gh<_i9.PaymentUseCase>(),
          gh<_i41.GetPlacesUseCase>(),
        ));
    gh.factory<_i48.PlaceDetailsViewModel>(() => _i48.PlaceDetailsViewModel(
          gh<_i43.GetSpecificPlacesUseCase>(),
          gh<_i40.CreateCommentAndRateUseCase>(),
        ));
    gh.factory<_i49.ProfileFromQRViewModel>(() => _i49.ProfileFromQRViewModel(
          gh<_i12.SharedPrefsUtils>(),
          gh<_i41.GetPlacesUseCase>(),
          gh<_i45.GetUsersUseCase>(),
          gh<_i44.GetSpecificUserUseCase>(),
        ));
    gh.factory<_i50.ProfileViewModel>(() => _i50.ProfileViewModel(
          gh<_i12.SharedPrefsUtils>(),
          gh<_i42.GetProfileUseCase>(),
          gh<_i41.GetPlacesUseCase>(),
          gh<_i45.GetUsersUseCase>(),
        ));
    gh.factory<_i51.TransactionsViewModel>(() => _i51.TransactionsViewModel(
          gh<_i20.GetTransactionsUseCase>(),
          gh<_i42.GetProfileUseCase>(),
        ));
    gh.factory<_i52.UpdatePictureViewModel>(() => _i52.UpdatePictureViewModel(
          gh<_i42.GetProfileUseCase>(),
          gh<_i36.UpdatePhotoUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i53.AppModule {}
