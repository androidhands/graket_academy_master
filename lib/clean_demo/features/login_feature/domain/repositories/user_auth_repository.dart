import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graket_academy_master/clean_demo/core/error/failure.dart';

abstract class UserAuthRepository {
  Future<Either<Failure, User?>> signinUser(String email, String password);
  Future<Either<Failure, User?>> emailSignUp(String email, String password);
  Future<void> userVerify();
  Future<void> signOut();
  Future<void> setLoggedIn();
  Future<void> setFirstOpen();
}
