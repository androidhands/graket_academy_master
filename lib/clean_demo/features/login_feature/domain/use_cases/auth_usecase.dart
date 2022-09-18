import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graket_academy_master/clean_demo/core/error/failure.dart';
import 'package:graket_academy_master/clean_demo/core/usecases/usecases.dart';
import 'package:graket_academy_master/clean_demo/features/login_feature/domain/repositories/user_auth_repository.dart';

class AuthParams extends Equatable {
  final String? email;
  final String? password;

  const AuthParams({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignInUseCase extends UseCases<User?, AuthParams> {
  final UserAuthRepository? userAuthRepository;

  SignInUseCase({this.userAuthRepository});

  @override
  Future<Either<Failure, User?>> call(AuthParams params) {
    return userAuthRepository!.signinUser(params.email!, params.password!);
  }
}
