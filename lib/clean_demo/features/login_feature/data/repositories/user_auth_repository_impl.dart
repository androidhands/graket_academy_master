import 'package:graket_academy_master/clean_demo/core/error/exceptions.dart';
import 'package:graket_academy_master/clean_demo/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:graket_academy_master/clean_demo/features/login_feature/data/data_sources/login_local_data_source.dart';
import 'package:graket_academy_master/clean_demo/features/login_feature/data/data_sources/login_remote_data_source.dart';

import '../../domain/repositories/user_auth_repository.dart';

class UserAuthRepositoryImpl implements UserAuthRepository {
  final LoginRemoteDataSource? loginRemoteDataSource;
  final LoginLocalDataSource? loginLocalDataSource;

  UserAuthRepositoryImpl(
      {this.loginRemoteDataSource, this.loginLocalDataSource});

  @override
  Future<Either<Failure, User?>> emailSignUp(
      String email, String password) async {
    try {
      var user = await loginRemoteDataSource!.emailSignUp(email, password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<void> setFirstOpen()async {
    loginLocalDataSource!.setFirstOpen();
  }

  @override
  Future<void> setLoggedIn() async {
    loginLocalDataSource!.setLoggedIn();
  }

  @override
  Future<void> signOut() async {
    loginRemoteDataSource!.signOut();
  }

  @override
  Future<Either<Failure, User?>> signinUser(
      String email, String password) async {
    try {
      var user = await loginRemoteDataSource!.signinUser(email, password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<void> userVerify() async {
    loginRemoteDataSource!.userVerify();
  }
}
