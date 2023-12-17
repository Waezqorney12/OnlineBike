// ignore_for_file: file_names
import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:bike_online_application/data/model/auth/profile.dart';
import 'package:bike_online_application/presentation/Home/dashboard/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class RegisterAuth {
  final Logger logger = Logger();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? _user;
  final _db = FirebaseFirestore.instance;

  Future<Profile> getUserProfile(
      {required String email, required BuildContext context}) async {
    final snapshots =
        await _db.collection('users').where('email', isEqualTo: email).get();
    final data = snapshots.docs.map((e) => Profile.fromFirestore(e)).single;
    return data;
  }

  Future userDetails(
      {required String email,
      required String password,
      String? gambarProfile,
      String? nama}) async {
    Profile profile = Profile(
        email: email,
        password: password,
        nama: nama,
        jenisKelamin: "Jenis Kelamin",
        alamat: "Alamat Tempat Tinggal",
        nomorTelepon: "Nomor Telepon",
        gambarProfile: gambarProfile,
        status: "Bronze");
    await _db.collection('users').add(profile.toFirestore());
  }

  Future<void> signUp(
      {required String emailUser,
      required String password,
      required String confirm,
      required BuildContext context}) async {
    try {
      if (!EmailValidator.validate(emailUser)) {
        ShowDialog().warningDialogs(context, "Invalid email format");
      } else if (confirm.isNotEmpty &&
          emailUser.isNotEmpty &&
          password.isNotEmpty) {
        if (confirm == password) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailUser, password: confirm);
          userDetails(email: emailUser, password: password);
          if (context.mounted) {
            ShowDialog().checkDialogs(context, "Sign Up Success");
          }
        } else {
          if (context.mounted) {
            ShowDialog().errorDialogs(context, "Password doesnt match");
          }
        }
      } else {
        if (context.mounted) {
          ShowDialog().errorDialogs(context, "Empty Password");
        }
      }
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          ShowDialog().warningDialogs(context, "Your password weak");
        }
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          ShowDialog().errorDialogs(context, 'Account already exist');
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> signUpWithGoogle(context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(authCredential);
        logger.d("Test: $userCredential");
        if (userCredential.additionalUserInfo!.isNewUser == true) {
          _user = userCredential.user;
          final data = userDetails(
              email: _user!.email.toString(),
              password: "123456",
              gambarProfile: _user!.photoURL.toString(),
              nama: _user!.displayName.toString());
          if (data != null) {
            if (context.mounted) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Dashboard(),
                  ));
            }
          }
        } else{
          ShowDialog().errorDialogs(context, "User already exist");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ShowDialog().warningDialogs(context, "Account already exist");
        } else if (e.code == 'invalid-credential') {
          ShowDialog().errorDialogs(context, "Invalid credential");
        } else {
          ShowDialog().errorDialogs(context, e.code);
        }
      } catch (e) {
        ShowDialog().errorDialogs(context, e.toString());
      }
    } else {
      ShowDialog().errorDialogs(context, "Canceled");
    }
    return _user;
  }
}
