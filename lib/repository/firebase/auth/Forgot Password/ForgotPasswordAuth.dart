// ignore_for_file: file_names

import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendEmail(BuildContext context,{required String email}) async {
    try {
      final snapshot = await _firestore.collection('users').where('email', isEqualTo: email).get();
      if (snapshot.docs.isNotEmpty) {
        await _auth.sendPasswordResetEmail(email: email);
        if(context.mounted) ShowDialog().checkDialogs(context, "Successfull sent");
      }else{
        if(context.mounted) ShowDialog().errorDialogs(context, "No email found");
      }
    }  catch (e) {
      if(context.mounted) ShowDialog().warningDialogs(context, e.toString());
    }
  }
}
