// ignore_for_file: file_names
import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterAuth {
  Future<void> signUp(String emailUser, String password, String confirm,
      BuildContext context) async {
    try {
      if (!EmailValidator.validate(emailUser)) {
        ShowDialog().warningDialogs(context, "Invalid email format");
      } else if (confirm.isNotEmpty &&emailUser.isNotEmpty &&password.isNotEmpty) {
        if (confirm == password) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailUser, password: confirm);
          if (context.mounted) {
            ShowDialog().checkDialogs(context, "Sign Up Success");
          }
        } else {
          if (context.mounted) {
            ShowDialog()
                .errorDialogs(context, "Password doesnt match");
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
          ShowDialog()
              .errorDialogs(context, 'Account already exist');
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
