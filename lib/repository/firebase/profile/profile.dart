// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:io';

import 'package:bike_online_application/model/auth/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

final class PersonalInformation {
  Logger logger = Logger();
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

  Future<Profile> getUserProfile({required String email}) async {
    final snapshots =
        await _db.collection('users').where('email', isEqualTo: email).get();
    final data = snapshots.docs.map((e) => Profile.fromFirestore(e)).single;
    return data;
  }

  Future<void> changeProfilePicture(
      BuildContext context, String profilePicture, String email) async {
    await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              _db
                  .collection('users')
                  .doc(element.id)
                  .update({'gambarProfile': profilePicture}).then(
                      (value) => context.named('/Profile'));
            }));
  }

  Future<void> selectImage(String email) async {
    String imageUrl = '';
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    file.validation();

    final fileName = DateTime.now().microsecondsSinceEpoch.toString();

    Reference reference = FirebaseStorage.instance.ref();
    Reference referenceDireImages = reference.child('images');

    Reference referenceImageToUpload = referenceDireImages.child(fileName);
    try {
      if (file?.path.isNotEmpty ?? false) {
        await referenceImageToUpload.putFile(File(file!.path));
        imageUrl = await referenceImageToUpload.getDownloadURL();
        if (imageUrl.isNotEmpty) {
          await _db
              .collection('users')
              .where('email', isEqualTo: email)
              .get()
              .then((value) => value.docs.forEach((element) {
                    _db
                        .collection('users')
                        .doc(element.id)
                        .update({'gambarProfile': imageUrl}).then((value) =>
                            _db.collection('users').doc(element.id).get());
                  }));
        }
      } else {
        logger.d('File path is empty');
      }
    } catch (e) {
      logger.d(e.toString());
    }
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

extension Valid<T> on T? {
  void validation() {
    if (this == null) {
      return;
    }
  }
}

extension Pathing on BuildContext {
  void named(String nav) => Navigator.pushReplacementNamed(this, nav);
}
