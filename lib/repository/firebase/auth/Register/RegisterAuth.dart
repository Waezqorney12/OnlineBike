// ignore_for_file: file_names
import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:bike_online_application/data/model/auth/profile.dart';
import 'package:bike_online_application/presentation/navigation/navigation.dart';
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

  Profile userDetails(
      {required String email,
      required String password,
      String? gambarProfile,
      String? nama}) {
    Profile profile = Profile(
        email: email,
        password: password,
        nama: nama,
        jenisKelamin: "Jenis Kelamin",
        alamat: "Alamat Tempat Tinggal",
        nomorTelepon: "Nomor Telepon",
        gambarProfile: gambarProfile,
        status: "Bronze");
    _db.collection('users').add(profile.toFirestore());
    
    return profile;
  }

  Future<void> signUpWithEmailAndPassword(
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
          userDetails(
              email: emailUser,
              password: password,
              gambarProfile: "Udentified picture",
              nama: "Udentified name");
          if (context.mounted) ShowDialog().checkDialogs(context, "Sign Up Success");
        } else {
          if (context.mounted) {
            ShowDialog().errorDialogs(context, "Password doesnt match");
          }
        }
      } else {
        if (context.mounted) ShowDialog().errorDialogs(context, "Empty Password");
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'weak-password':
          if (context.mounted) ShowDialog().warningDialogs(context, "Your password weak");
          break;
        case 'email-already-in-use':
          if (context.mounted) ShowDialog().errorDialogs(context, 'Account already exist');
        default:
          if (context.mounted) ShowDialog().errorDialogs(context, 'Udentified Error');
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
              email: _user?.email.toString() ?? "Udentified email",
              password: "123456",
              gambarProfile: _user?.photoURL.toString() ?? "Udentified picture",
              nama: _user?.displayName.toString() ?? "Udentified name");
          if (data.email != null) {
            if (context.mounted) Navigator.of(context).pushReplacementNamed('/Navigation');
          } else {
            ShowDialog().errorDialogs(context, "Data unavailable");
          }
        } else {
          ShowDialog().errorDialogs(context, "User already exist");
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'account-exists-with-different-credential':
            ShowDialog().warningDialogs(context, "Account already exist");
            break;
          case 'invalid-credential':
            ShowDialog().errorDialogs(context, "Invalid credential");
            break;
          default:
            ShowDialog().errorDialogs(context, e.code);
        }
      } catch (e) {
        ShowDialog().errorDialogs(context, e.toString());
      }
    } else {
      ShowDialog().warningDialogs(context, "Canceled");
    }
    return _user;
  }
}
