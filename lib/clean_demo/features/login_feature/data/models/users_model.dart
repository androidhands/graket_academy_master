import 'package:graket_academy_master/clean_demo/features/login_feature/domain/entities/users_entity.dart';
import 'package:meta/meta.dart';

class UsersModel extends UsersEntity {
  UsersModel(
      {@required String? uid, @required String? email, @required verified})
      : super(uid, email, verified);
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        uid: json['uid'], email: json['email'], verified: json['verified']);
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'verified': verified};
  }
}
