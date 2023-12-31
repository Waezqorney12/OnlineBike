// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class PersonalInformation {
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;
}
final class ChangeNamaAccount extends PersonalInformation {
  Future<void> changeNama(
      BuildContext context, String nama, String email) async {
    await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              _db
                  .collection('users')
                  .doc(element.id)
                  .update({"nama": nama}).then(
                      (value) {
                        context.named('/Costum');
                      });
            }));
            
  }
}
final class ChangeAddressAccount extends PersonalInformation {
  Future<void> changeAddress(
      BuildContext context, String alamat, String email) async {
    await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              _db
                  .collection('users')
                  .doc(element.id)
                  .update({'alamat': alamat}).then(
                      (value) {
                        context.named('/Costum');
                      });
            }));
            
  }
}
final class ChangeNumberAccount extends PersonalInformation {
  Future<void> changeNumber(
      BuildContext context, String number, String email) async {
    await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              _db
                  .collection('users')
                  .doc(element.id)
                  .update({'nomorTelepon': number}).then(
                      (value) => context.named('/Costum'));
            }));
  }
}

final class DeleteAccount extends PersonalInformation {
  Future<void> deleteAccount(BuildContext context, String email) async {
    await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              _db.collection('users').doc(element.id).delete().then((value) {
                _user!.delete();
                context.named('/Login');
              });
            }));
  }
}

extension Pathing on BuildContext {
  void named(String nav) => Navigator.pushReplacementNamed(this, nav);
}
