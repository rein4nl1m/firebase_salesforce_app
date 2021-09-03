abstract class UserEntity {
  String name;
  String? lastName;
  String uid;
  String email;

  UserEntity({
    required this.name,
    this.lastName,
    required this.uid,
    required this.email,
  });
}
