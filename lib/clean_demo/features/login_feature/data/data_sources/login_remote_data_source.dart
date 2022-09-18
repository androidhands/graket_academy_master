import 'package:firebase_auth/firebase_auth.dart';
import 'package:graket_academy_master/clean_demo/core/error/exceptions.dart';

abstract class LoginRemoteDataSource {
  Future<User?> signinUser(String email, String password);
  Future<User?> emailSignUp(String email, String password);
  Future<void> userVerify();
  Future<void> signOut();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FirebaseAuth? firebaseAuth;

  LoginRemoteDataSourceImpl({this.firebaseAuth});

  @override
  Future<User?> signinUser(String email, String password) async {
    try {
      final response = await firebaseAuth!.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response.user;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message!);
    }
  }

  @override
  Future<User?> emailSignUp(String email, String password) async {
    try {
      final response = await firebaseAuth!.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response.user;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message!);
    }
  }

  @override
  Future<void> userVerify() async {
    try {
      await firebaseAuth!.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message!);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth!.signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message!);
    }
  }
}
