import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final String? uid;
  final String? email;
   bool verified = false;

   UsersEntity(this.uid, this.email, this.verified);

  @override
  List<Object?> get props => [uid!, email!, verified!];
}
