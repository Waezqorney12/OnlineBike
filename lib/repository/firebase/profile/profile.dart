// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bike_online_application/model/auth/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final class PersonalInformation {
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

  Future<Profile> getUserProfile(
      {required String email}) async {
    final snapshots =
        await _db.collection('users').where('email', isEqualTo: email).get();
    final data = snapshots.docs.map((e) => Profile.fromFirestore(e)).single;
    return data;
  }
  
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
                  .update({"nama": nama}).then((value) {
                context.named('/Costum');
              });
            }));
  }

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
                  .update({'alamat': alamat}).then((value) {
                context.named('/Costum');
              });
            }));
  }

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
