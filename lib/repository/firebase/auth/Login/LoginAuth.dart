// ignore_for_file: file_names
import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:bike_online_application/presentation/navigation/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

class LoginAuth {
  UserCredential? _userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginAuth(
      String email, String password, BuildContext context) async {
    try {
      _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_userCredential!.user!.email!.isNotEmpty) {
        if (context.mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Navigations(),
              ));
        }
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        logger.d('User not found for that email');
      } else if (e.code == 'wrong-password') {
        logger.d('Password doesnt match for that email');
      }
    } catch (e) {
      throw Exception(e);
    }
    return _userCredential;
  }

  Future<UserCredential?> firebaseGoogleSignIn(BuildContext context) async {
    final GoogleSignInAccount? login = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await login?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    try {
      _userCredential = await _auth.signInWithCredential(credential);
      if (_userCredential!.additionalUserInfo!.isNewUser == false) {
        if (_userCredential!.credential!.accessToken!.isNotEmpty &&
            _userCredential!.credential!.providerId.isNotEmpty) {
          if (context.mounted) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Navigations(),
                ));
          }
        }
      } else {
        if (context.mounted) ShowDialog().errorDialogs(context, "No account found");
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) ShowDialog().warningDialogs(context, "Code: ${e.toString()}");
    }
    return _userCredential;
  }
}
