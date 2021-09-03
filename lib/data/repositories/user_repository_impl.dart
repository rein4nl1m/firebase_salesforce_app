import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_salesforce_app/core/eithers/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_salesforce_app/core/eithers/success/success.dart';
import 'package:firebase_salesforce_app/data/models/user_model.dart';
import 'package:firebase_salesforce_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<Failure, Success>> createUserProfile({
    required String name,
    String? lastName,
    required String email,
    required String uid,
  }) async {
    try {
      final _usersCollection = FirebaseFirestore.instance.collection('users');
      var _user = UserModel(name: name, uid: uid, email: email);
      await _usersCollection.add(_user.toJson());

      return right(VoidSuccess());
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> currentUserProfile() async {
    try {
      final _auth = FirebaseAuth.instance;
      var user = _auth.currentUser;

      if (user == null) return left(ServerFailure());

      final _usersCollection = FirebaseFirestore.instance.collection('users');

      final response =
          await _usersCollection.where('uid', isEqualTo: user.uid).get();

      var result = response.docs;
      var userProfile =
          result.map((doc) => UserModel.fromJson(doc.data())).first;

      return right(userProfile);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
