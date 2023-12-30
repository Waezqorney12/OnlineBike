// ignore_for_file: file_names
import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

class LoginAuth {
  UserCredential? _userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      if (context.mounted) context.named('/Login');
    } catch (e) {
      if (context.mounted) context.error('Something went wrong');
    }
  }

  Future<void> deleteAccount(BuildContext context, String email) async {
    await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              _db.collection('users').doc(element.id).delete().then(
                  (value) {
                    _user!.delete();
                    context.named('/Login');
                  } );
            }));
  }

  Future<void> emailLogin(
      String email, String password, BuildContext context) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        _userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (context.mounted) _userCredential.validationEmail(context);
      } on FirebaseException catch (e) {
        switch (e.code) {
          case 'user-not-found':
            if (context.mounted) context.warning('No user found');
            break;
          case 'wrong-password':
            if (context.mounted) context.error('Wrong password');
            break;
          case 'channel-error':
            if (context.mounted)
              context.warning('Unable to establish connection');
            break;
          default:
            if (context.mounted) context.error(e.toString());
        }
      } catch (e) {
        if (context.mounted) context.warning(e.toString());
      }
    } else {
      context.warning("Email or password can't be empty");
    }
  }

  Future<void> firebaseGoogleSignIn(BuildContext context) async {
    final GoogleSignInAccount? login = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await login?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    try {
      _userCredential = await _auth.signInWithCredential(credential);

      if (_userCredential!.additionalUserInfo!.isNewUser == false) {
        if (_userCredential!.credential!.accessToken!.isNotEmpty &&
            _userCredential!.credential!.providerId.isNotEmpty) {
          if (context.mounted) context.named('/Navigation');
        }
      } else {
        if (context.mounted) context.error("No account found");
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) context.error(e.toString());
    }
  }
}

extension Dialog on BuildContext {
  void warning(String text) => ShowDialog().warningDialogs(this, text);
  void error(String text) => ShowDialog().errorDialogs(this, text);
  void success(String text) => ShowDialog().checkDialogs(this, text);
}

extension Pathing on BuildContext {
  void named(String nav) => Navigator.pushReplacementNamed(this, nav);
}

extension Valid<T> on T? {
  void validationGoogle(BuildContext context) {}
  void validationEmail(BuildContext context) {
    if (this != null) {
      Navigator.pushReplacementNamed(context, '/Navigation');
    }
  }
}
