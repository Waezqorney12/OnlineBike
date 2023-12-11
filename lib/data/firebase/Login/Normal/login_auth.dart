// ignore_for_file: file_names

import 'package:bike_online_application/common/component/Font/MontserratText.dart';
import 'package:bike_online_application/presentation/Home/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

class LoginAuth {
  Future<UserCredential?> loginAuth(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        logger.d('User not found for that email');
      } else if(e.code == 'wrong-password'){
        logger.d('Password doesnt match for that email');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  
}
