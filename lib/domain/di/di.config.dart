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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i18;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i23;
import '../../data/repos/home_repo/home_repo.dart' as _i25;
import '../../data/repos/payment/ds/payment_online_ds.dart' as _i6;
import '../../data/repos/payment/payment_repo.dart' as _i8;
import '../../data/repos/profile/ds/profile_online_ds.dart' as _i31;
import '../../data/repos/profile/profile_repo.dart' as _i33;
import '../../data/repos/transactions/ds/transactions_online_ds.dart' as _i14;
import '../../data/repos/transactions/transactions_repo.dart' as _i16;
import '../../data/utils/shared_utils.dart' as _i11;
import '../../shared_locale/helper.dart' as _i10;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i40;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i37;
import '../../ui/screens/auth/login/login_view_model.dart' as _i27;
import '../../ui/screens/auth/signup/register_view_model.dart' as _i35;
import '../../ui/screens/main/main_screen_view_model.dart' as _i52;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i51;
import '../../ui/screens/main/tabs/home/place_details/place_details_view_model.dart'
    as _i54;
import '../../ui/screens/main/tabs/profile/add_place/add_place_view_model.dart'
    as _i42;
import '../../ui/screens/main/tabs/profile/change_password/change_pass_view_model.dart'
    as _i20;
import '../../ui/screens/main/tabs/profile/profile_view_model.dart' as _i56;
import '../../ui/screens/main/tabs/profile/update_picture/update_picture_view_model.dart'
    as _i58;
import '../../ui/screens/main/tabs/scan_qr/profile_from_qr/profile_view_model.dart'
    as _i55;
import '../../ui/screens/main/tabs/scan_qr/scan_qr_view_model.dart' as _i9;
import '../../ui/screens/main/tabs/transaction/transactions_view_model.dart'
    as _i57;
import '../../ui/screens/payment/cash_payment/cash_payment_view_model.dart'
    as _i43;
import '../../ui/screens/payment/online_payment/online_payment_view_model.dart'
    as _i53;
import '../../ui/screens/payment/payment_details/payment_details_view_model.dart'
    as _i4;
import '../../ui/screens/splash/splash_view_model.dart' as _i12;
import '../repos/auth_repo/auth_repo.dart' as _i17;
import '../repos/home_repo/ds/home_online_ds.dart' as _i22;
import '../repos/home_repo/home_repo.dart' as _i24;
import '../repos/payment/ds/payment_online_ds.dart' as _i5;
import '../repos/payment/payment_repo.dart' as _i7;
import '../repos/profile/ds/profile_online_ds.dart' as _i30;
import '../repos/profile/profile_repo.dart' as _i32;
import '../repos/transactions/ds/transactions_online_ds.dart' as _i13;
import '../repos/transactions/transactions_repo.dart' as _i15;
import '../use_cases/add_place_use_case.dart' as _i41;
import '../use_cases/change_pass_use_case.dart' as _i19;
import '../use_cases/create_comment_and_rate_use_case.dart' as _i44;
import '../use_cases/get_place_comments_use_case.dart' as _i45;
import '../use_cases/get_places_use_case.dart' as _i46;
import '../use_cases/get_profile_use_case.dart' as _i47;
import '../use_cases/get_specific_place_use_case.dart' as _i48;
import '../use_cases/get_specific_user_use_case.dart' as _i49;
import '../use_cases/get_transactions_use_case.dart' as _i21;
import '../use_cases/get_users_use_case.dart' as _i50;
import '../use_cases/login_use_case.dart' as _i26;
import '../use_cases/payment_cash_use_case.dart' as _i28;
import '../use_cases/payment_use_case.dart' as _i29;
import '../use_cases/register_use_case.dart' as _i34;
import '../use_cases/send_otp_use_case.dart' as _i36;
import '../use_cases/update_photo_use_case.dart' as _i38;
import '../use_cases/verification_otp_use_case.dart' as _i39;
import 'app_module.dart' as _i59;

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
    gh.factory<_i9.ScanQRViewModel>(() => _i9.ScanQRViewModel());
    gh.factory<_i10.SharedPreferenceGlobal>(
        () => _i10.SharedPreferenceGlobal());
    gh.factory<_i11.SharedPrefsUtils>(() => _i11.SharedPrefsUtils());
    gh.factory<_i12.SplashViewModel>(() => _i12.SplashViewModel());
    gh.factory<_i13.TransactionsOnlineDS>(
        () => _i14.TransactionsOnlineDSImpl());
    gh.factory<_i15.TransactionsRepo>(() => _i16.TransactionsRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i13.TransactionsOnlineDS>(),
        ));
    gh.factory<_i17.AuthRepo>(() => _i18.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i11.SharedPrefsUtils>(),
        ));
    gh.factory<_i19.ChangePassUseCase>(
        () => _i19.ChangePassUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i20.ChangePassViewModel>(
        () => _i20.ChangePassViewModel(gh<_i19.ChangePassUseCase>()));
    gh.factory<_i21.GetTransactionsUseCase>(
        () => _i21.GetTransactionsUseCase(gh<_i15.TransactionsRepo>()));
    gh.factory<_i22.HomeOnlineDS>(() => _i23.HomeOnlineDSImpl(
          gh<_i11.SharedPrefsUtils>(),
          gh<_i10.SharedPreferenceGlobal>(),
        ));
    gh.factory<_i24.HomeRepo>(() => _i25.HomeRepoImpl(
          gh<_i22.HomeOnlineDS>(),
          gh<_i3.Connectivity>(),
        ));
    gh.factory<_i26.LoginUseCase>(() => _i26.LoginUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i27.LoginViewModel>(
        () => _i27.LoginViewModel(gh<_i26.LoginUseCase>()));
    gh.factory<_i28.PaymentCashUseCase>(
        () => _i28.PaymentCashUseCase(gh<_i7.PaymentRepo>()));
    gh.factory<_i29.PaymentOnlineUseCase>(
        () => _i29.PaymentOnlineUseCase(gh<_i7.PaymentRepo>()));
    gh.factory<_i30.ProfileOnlineDS>(
        () => _i31.ProfileOnlineDSImpl(gh<_i11.SharedPrefsUtils>()));
    gh.factory<_i32.ProfileRepo>(() => _i33.ProfileRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i30.ProfileOnlineDS>(),
        ));
    gh.factory<_i34.RegisterUseCase>(
        () => _i34.RegisterUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i35.RegisterViewModel>(
        () => _i35.RegisterViewModel(gh<_i34.RegisterUseCase>()));
    gh.factory<_i36.SendOTPUseCase>(
        () => _i36.SendOTPUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i37.SendOTPViewModel>(
        () => _i37.SendOTPViewModel(gh<_i36.SendOTPUseCase>()));
    gh.factory<_i38.UpdatePhotoUseCase>(
        () => _i38.UpdatePhotoUseCase(gh<_i32.ProfileRepo>()));
    gh.factory<_i39.VerificationOTPUseCase>(
        () => _i39.VerificationOTPUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i40.VerificationOTPViewModel>(
        () => _i40.VerificationOTPViewModel(gh<_i39.VerificationOTPUseCase>()));
    gh.factory<_i41.AddPlaceUseCase>(
        () => _i41.AddPlaceUseCase(gh<_i32.ProfileRepo>()));
    gh.factory<_i42.AddPlaceViewModel>(
        () => _i42.AddPlaceViewModel(gh<_i41.AddPlaceUseCase>()));
    gh.factory<_i43.CashPaymentViewModel>(
        () => _i43.CashPaymentViewModel(gh<_i28.PaymentCashUseCase>()));
    gh.factory<_i44.CreateCommentAndRateUseCase>(
        () => _i44.CreateCommentAndRateUseCase(gh<_i24.HomeRepo>()));
    gh.factory<_i45.GetPlaceCommentsUseCase>(
        () => _i45.GetPlaceCommentsUseCase(gh<_i24.HomeRepo>()));
    gh.factory<_i46.GetPlacesUseCase>(
        () => _i46.GetPlacesUseCase(gh<_i24.HomeRepo>()));
    gh.factory<_i47.GetProfileUseCase>(
        () => _i47.GetProfileUseCase(gh<_i32.ProfileRepo>()));
    gh.factory<_i48.GetSpecificPlacesUseCase>(
        () => _i48.GetSpecificPlacesUseCase(gh<_i24.HomeRepo>()));
    gh.factory<_i49.GetSpecificUserUseCase>(
        () => _i49.GetSpecificUserUseCase(gh<_i32.ProfileRepo>()));
    gh.factory<_i50.GetUsersUseCase>(
        () => _i50.GetUsersUseCase(gh<_i32.ProfileRepo>()));
    gh.factory<_i51.HomeViewModel>(
        () => _i51.HomeViewModel(gh<_i46.GetPlacesUseCase>()));
    gh.factory<_i52.MainViewModel>(() => _i52.MainViewModel(
          gh<_i10.SharedPreferenceGlobal>(),
          gh<_i29.PaymentOnlineUseCase>(),
          gh<_i46.GetPlacesUseCase>(),
        ));
    gh.factory<_i53.OnlinePaymentViewModel>(
        () => _i53.OnlinePaymentViewModel(gh<_i29.PaymentOnlineUseCase>()));
    gh.factory<_i54.PlaceDetailsViewModel>(() => _i54.PlaceDetailsViewModel(
          gh<_i48.GetSpecificPlacesUseCase>(),
          gh<_i44.CreateCommentAndRateUseCase>(),
          gh<_i45.GetPlaceCommentsUseCase>(),
        ));
    gh.factory<_i55.ProfileFromQRViewModel>(() => _i55.ProfileFromQRViewModel(
          gh<_i11.SharedPrefsUtils>(),
          gh<_i46.GetPlacesUseCase>(),
          gh<_i50.GetUsersUseCase>(),
          gh<_i49.GetSpecificUserUseCase>(),
        ));
    gh.factory<_i56.ProfileViewModel>(() => _i56.ProfileViewModel(
          gh<_i11.SharedPrefsUtils>(),
          gh<_i47.GetProfileUseCase>(),
          gh<_i46.GetPlacesUseCase>(),
          gh<_i50.GetUsersUseCase>(),
        ));
    gh.factory<_i57.TransactionsViewModel>(() => _i57.TransactionsViewModel(
          gh<_i21.GetTransactionsUseCase>(),
          gh<_i47.GetProfileUseCase>(),
        ));
    gh.factory<_i58.UpdatePictureViewModel>(() => _i58.UpdatePictureViewModel(
          gh<_i47.GetProfileUseCase>(),
          gh<_i38.UpdatePhotoUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i59.AppModule {}
