// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/auth_repository_impl.dart' as _i5;
import '../../data/repositories/user_repository_impl.dart' as _i10;
import '../../domain/repositories/auth_repository.dart' as _i4;
import '../../domain/repositories/user_repository.dart' as _i9;
import '../../domain/use_case/auth/sign_in.dart' as _i7;
import '../../domain/use_case/auth/sign_out.dart' as _i8;
import '../../domain/use_case/user/create_user_profile.dart' as _i12;
import '../../domain/use_case/user/register_user.dart' as _i6;
import '../../domain/use_case/user/user_profile_info.dart' as _i15;
import '../../domain/use_case/user/verify_email.dart' as _i11;
import '../../presentation/pages/auth/login/controller/login_controller.dart'
    as _i13;
import '../../presentation/pages/auth/register/controller/register_controller.dart'
    as _i14;
import '../../presentation/pages/home/controller/home_controller.dart' as _i16;
import '../analytics/analytics_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AnalyticsService>(() => _i3.AnalyticsService());
  gh.factory<_i4.AuthRepository>(() => _i5.AuthRepositoryImpl());
  gh.factory<_i6.RegisterUser>(
      () => _i6.RegisterUser(authRepository: get<_i4.AuthRepository>()));
  gh.factory<_i7.SignIn>(
      () => _i7.SignIn(authRepository: get<_i4.AuthRepository>()));
  gh.factory<_i8.SignOut>(
      () => _i8.SignOut(authRepository: get<_i4.AuthRepository>()));
  gh.factory<_i9.UserRepository>(() => _i10.UserRepositoryImpl());
  gh.factory<_i11.VerifyEmail>(
      () => _i11.VerifyEmail(authRepository: get<_i4.AuthRepository>()));
  gh.factory<_i12.CreateUserProfile>(
      () => _i12.CreateUserProfile(userRepository: get<_i9.UserRepository>()));
  gh.factory<_i13.LoginController>(() => _i13.LoginController(
      signInUseCase: get<_i7.SignIn>(), signOutUseCase: get<_i8.SignOut>()));
  gh.factory<_i14.RegisterController>(() => _i14.RegisterController(
      registerUserUseCase: get<_i6.RegisterUser>(),
      createUserProfileUseCase: get<_i12.CreateUserProfile>(),
      verifyEmailUseCase: get<_i11.VerifyEmail>()));
  gh.factory<_i15.UserProfileInfo>(
      () => _i15.UserProfileInfo(userRepository: get<_i9.UserRepository>()));
  gh.factory<_i16.HomeController>(
      () => _i16.HomeController(userInfoUseCase: get<_i15.UserProfileInfo>()));
  return get;
}
