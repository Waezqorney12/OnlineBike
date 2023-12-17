import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/data/model/auth/profile.dart';
import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.background,
      body: FutureBuilder<Profile>(
          future: RegisterAuth()
              .getUserProfile(email: user!.email.toString(), context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: PoppinText(
                  text: "Snapshot Error",
                  fontSize: Dimensions.font14(context),
                  weight: FontWeight.bold,
                  isBlack: false,
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    data!.gambarProfile!.isNotEmpty ? Image.network(data.gambarProfile.toString()) : const Icon(Icons.abc),
                    ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        child: PoppinText(
                            text: "Log Out",
                            fontSize: Dimensions.font14(context),
                            weight: FontWeight.w500)),
                    PoppinText(
                      text: user!.email.toString(),
                      fontSize: Dimensions.font20(context),
                      weight: FontWeight.bold,
                      isBlack: false,
                    ),
                    PoppinText(
                      text: data.status.toString(),
                      fontSize: Dimensions.font20(context),
                      weight: FontWeight.bold,
                      isBlack: false,
                    ),
                    PoppinText(
                      text: data.gambarProfile.toString(),
                      fontSize: Dimensions.font20(context),
                      weight: FontWeight.bold,
                      isBlack: false,
                    ),
                    PoppinText(
                      text: data.nama.toString(),
                      fontSize: Dimensions.font20(context),
                      weight: FontWeight.bold,
                      isBlack: false,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
