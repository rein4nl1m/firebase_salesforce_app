import 'package:firebase_auth/firebase_auth.dart';
import '/core/eithers/success/success.dart';
import '/domain/use_case/user/create_user_profile.dart';
import '/domain/use_case/user/register_user.dart';
import '/domain/use_case/user/verify_email.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

@injectable
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterUser registerUserUseCase;
  final CreateUserProfile createUserProfileUseCase;
  final VerifyEmail verifyEmailUseCase;

  _RegisterControllerBase({
    required this.registerUserUseCase,
    required this.createUserProfileUseCase,
    required this.verifyEmailUseCase,
  });

  @action
  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await registerUserUseCase(
        email: email,
        password: password,
      );

      return response.fold(
        (failure) => throw failure,
        (userCredential) => userCredential,
      );
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> sendEmailVerification() async {
    try {
      final response = await verifyEmailUseCase();

      return response.fold(
        (failure) => throw failure,
        (success) => VoidSuccess(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> createUserProfile({
    required String name,
    String? lastName,
    required String email,
    required String uid,
  }) async {
    try {
      final response = await createUserProfileUseCase(
        email: email,
        name: name,
        uid: uid,
        lastName: lastName,
      );

      return response.fold(
        (failure) => throw failure,
        (success) => VoidSuccess(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
