// ignore_for_file: file_names

import 'package:bike_online_application/common/component/Font/MontserratText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterAuth {
  Future<void> _showDialog(
      BuildContext context, String text, double fontSize) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Montserrat(
            text: text,
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> signUp(String email, String password, String confirm,BuildContext context) async {
    try {
      if (confirm.isNotEmpty) {
        if (confirm == password) {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: confirm);
          if (context.mounted) {
            _showDialog(context, "Sign Up Success", 14);
          }
        } 
      } 
    } on FirebaseException catch (e) {
      if (e.code == 'empty-confirmation') {
        if (context.mounted) {
          _showDialog(context, "Empty email and password", 14);
        }
      }
      else if (e.code == 'password-missmatch') {
        if (context.mounted) {
          _showDialog(context, "Password doesnt match with previous", 14);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
