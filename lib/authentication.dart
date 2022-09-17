import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  bool? isVerified() {
    _auth.currentUser?.reload();
    return _auth.currentUser?.emailVerified;
  }

  Future emailSignUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future emailSignIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future userVerify() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

// class PhoneAuthentication {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
// 
//   get user => _auth.currentUser;
// 
//   Future phoneSignUp({required String phoneNumber}) async {
//     try {
//       await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           // ANDROID ONLY!
//           // Sign the user in (or link) with the auto-generated credential
//           print(1);
//           await _auth.signInWithCredential(credential);
//           print(2);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           if (e.code == 'invalid-phone-number') {
//             print(3);
//             print('The provided phone number is not valid.');
//           }
//           // Handle other errors
//         },
//         codeSent: (String verificationId, int? resendToken) async {
//           // Update the UI - wait for the user to enter the SMS code
//           String smsCode = '252525';
//           // Create a PhoneAuthCredential with the code
//           PhoneAuthCredential credential = PhoneAuthProvider.credential(
//               verificationId: verificationId, smsCode: smsCode);
//           // Sign the user in (or link) with the credential
//           await _auth.signInWithCredential(credential);
//         },
//         timeout: const Duration(seconds: 60),
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
// }
