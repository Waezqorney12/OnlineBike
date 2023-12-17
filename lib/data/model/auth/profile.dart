import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final String? email;
  final String? password;
  final String? nama;
  final String? jenisKelamin;
  final String? alamat;
  final String? nomorTelepon;
  final String? gambarProfile;
  final String? status;

  Profile(
      {required this.email,
      required this.password,
      required this.nama,
      required this.jenisKelamin,
      required this.alamat,
      required this.nomorTelepon,
      required this.gambarProfile,
      required this.status});

  factory Profile.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Profile(
        email: data!['email'],
        password: data['password'],
        nama: data['nama'],
        jenisKelamin: data['jenisKelamin'],
        alamat: data['alamat'],
        nomorTelepon: data['nomorTelepon'],
        gambarProfile: data['gambarProfile'] ,
        status: data['status']);
  }

    Map<String, dynamic> toFirestore(){
    return {
      if(email != null) "email":email,
      if(password != null) "password" : password,
      if(nama != null ) "nama" : nama,
      if(jenisKelamin != null) "jenisKelamin" : jenisKelamin,
      if(alamat != null) "alamat" : alamat,
      if(nomorTelepon != null) "nomorTelepon" : nomorTelepon,
      if(gambarProfile != null) "gambarProfile" : gambarProfile,
      if(status != null) "status" : status
    };
  }
}
