// ignore_for_file: unused_import

import 'package:bike_online_application/common/component/AppBar.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/HiddenText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/model/auth/profile.dart';
import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CostumAccountPage extends StatefulWidget {
  const CostumAccountPage({super.key});

  @override
  State<CostumAccountPage> createState() => _CostumAccountPageState();
}

class _CostumAccountPageState extends State<CostumAccountPage> {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(path: '/Profile', text: 'Costums Account'),
      backgroundColor: ColorClass.background,
      body: FutureBuilder<Profile>(
          future: RegisterAuth()
              .getUserProfile(email: _user!.email.toString(), context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: PoppinText(
                text: "No data",
                fontSize: Dimensions.font20(context),
                weight: FontWeight.bold,
                color: ColorClass.white,
              ));
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Dimensions.height180(context),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImageClass.backgroundDefault),
                            fit: BoxFit.fill)),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            bottom: Dimensions.minHeight70(context),
                            left: Dimensions.widht20(context),
                            child: data?.gambarProfile.toString() ==
                                    "Udentified picture"
                                ? profilePicture(context,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            ImageClass.defaultPictureProfile)))
                                : profilePicture(context,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            data!.gambarProfile.toString())))),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height75(context)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.widht25(context),
                        vertical: Dimensions.height10(context)),
                    child: PoppinText(
                        color: ColorClass.white,
                        text: "Personal Information",
                        fontSize: Dimensions.font16(context),
                        weight: FontWeight.w600),
                  ),
                  menu(context,
                      icon: Icons.email, title: data!.email.toString(),isTrailing: false),
                  InkWell(
                    onTap: ()=> Navigator.pushReplacementNamed(context, '/Name'),
                    child: menu(context,
                        icon: Icons.person, title: data.nama.toString()),
                  ),
                  InkWell(
                    onTap: ()=> Navigator.pushReplacementNamed(context, '/Address'),
                    child: menu(context,
                        icon: Icons.maps_home_work_rounded,
                        title: data.alamat.toString()),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/Phone'),
                    child: menu(context,
                        icon: Icons.phone, title: data.nomorTelepon.toString()),
                  )
                ],
              );
            } else {
              return Center(
                  child: BinaryPoppinText(
                      text: 'Error',
                      fontSize: Dimensions.font20(context),
                      weight: FontWeight.bold));
            }
          }),
    );
  }

  Padding menu(BuildContext contex,
      {required IconData icon, required String title, bool isTrailing = true}) {
    final Widget widget = isTrailing == true
        ? Icon(
            size: Dimensions.font20(context),
            Icons.arrow_forward_ios_rounded,
            color: ColorClass.white,
          )
        : const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height5(context)),
      child: ListTile(
        leading: Container(
          height: Dimensions.height45(context),
          width: Dimensions.widht45(context),
          decoration: BoxDecoration(
            color: ColorClass.backgroundIcon,
            shape: BoxShape.circle,
          ),
          child: Icon(icon,
              size: Dimensions.font28(context), color: ColorClass.blueIcon),
        ),
        title: PoppinText(
          text: title,
          fontSize: Dimensions.font14(context),
          weight: FontWeight.bold,
          color: ColorClass.white,
        ),
        trailing: widget
      ),
    );
  }

  Container profilePicture(BuildContext context,
      {required DecorationImage image}) {
    return Container(
      width: Dimensions.height100(context),
      height: Dimensions.height100(context),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorClass.background, // Setel warna shadow menjadi transparan
          spreadRadius: Dimensions.widht10(
              context), // Atur spreadRadius sesuai dengan lebar border
        ),
      ], shape: BoxShape.circle, image: image),
    );
  }

  Padding textData(String text, BuildContext context,
      {required bool isTrue, bool isDimensions = true, bool isSize = true}) {
    final Color isSwitching =
        isTrue == true ? ColorClass.white : ColorClass.blueStatus;

    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.widht130(context),
          top: isDimensions ? 0 : Dimensions.height10(context)),
      child: PoppinText(
        text: text,
        fontSize:
            isSize ? Dimensions.font12(context) : Dimensions.font14(context),
        weight: FontWeight.bold,
        color: isSwitching,
      ),
    );
  }
}
