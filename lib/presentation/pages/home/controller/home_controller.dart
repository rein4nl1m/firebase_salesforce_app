import 'package:firebase_salesforce_app/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '/domain/use_case/user/user_profile_info.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@injectable
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final UserProfileInfo userInfoUseCase;

  _HomeControllerBase({required this.userInfoUseCase});

  @observable
  UserModel? userProfile;

  @action
  Future<void> currentUserProfileInfo() async {
    try {
      if (userProfile != null) return;

      final response = await userInfoUseCase();

      return response.fold(
        (failure) => throw failure,
        (userProfile) => this.userProfile = userProfile,
      );
    } catch (e) {
      rethrow;
    }
  }
}
