import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/data/model/auth/profile.dart';
import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                child: BinaryPoppinText(
                  text: "Snapshot Error",
                  fontSize: Dimensions.font14(context),
                  weight: FontWeight.bold,
                  isBlack: false,
                ),
              );
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
                            bottom: Dimensions.minHeight75(context),
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
                  textData(data!.nama.toString(), context,
                      isTrue: true, isDimensions: false, isSize: false),
                  textData(data.status.toString(), context,
                      isTrue: false, isSize: false),
                  SizedBox(height: Dimensions.height20(context)),
                  subText(context, text: "Personal Information"),
                  boxInformation(),
                  subText(context, text: "Credit Card"),
                  boxCredit()
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Container profilePicture(BuildContext context,
      {required DecorationImage image}) {
    return Container(
      width: Dimensions.height140(context),
      height: Dimensions.height140(context),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorClass.background, // Setel warna shadow menjadi transparan
          spreadRadius: Dimensions.widht10(
              context), // Atur spreadRadius sesuai dengan lebar border
        ),
      ], shape: BoxShape.circle, image: image),
    );
  }

  Padding boxInformation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widht20(context)),
      child: Container(
        height: Dimensions.height185(context),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorClass.boxUp, ColorClass.boxDown])),
      ),
    );
  }

  Padding boxCredit() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widht20(context)),
      child: Container(
        height: Dimensions.height185(context),
        width: Dimensions.screenWidht(context),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(.5), spreadRadius: .3)
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Stack(
          children: [
            logoCard(left: Dimensions.widht15(context)),
            logoCard(isDefault: false, left: Dimensions.widht30(context)),
            gradientCreditCart(
                color: ColorClass.effectCard.withOpacity(.25), right: -100),
            gradientCreditCart(
                color: ColorClass.effectCard.withOpacity(.25), right: -150),
            gradientCreditCart(
                color: ColorClass.effectCard.withOpacity(.35), right: -200),
            Positioned(
                right: Dimensions.widht15(context),
                bottom: Dimensions.height15(context),
                child: Image.asset(ImageClass.chip)),
          ],
        ),
      ),
    );
  }

  Positioned logoCard({bool isDefault = true, required double left}) {
    return Positioned(
      top: Dimensions.height10(context),
      left: left,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
            color: isDefault
                ? ColorClass.logoCard1.withOpacity(.9)
                : ColorClass.logoCard2.withOpacity(.9),
            shape: BoxShape.circle),
      ),
    );
  }

  Positioned gradientCreditCart({required Color color, required double right}) {
    return Positioned(
      top: -25,
      right: right,
      child: Transform.rotate(
        angle: math.pi / 4,
        child: Container(
          height: Dimensions.height250(context),
          width: Dimensions.widht250(context),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(60)),
        ),
      ),
    );
  }

  Padding subText(BuildContext context, {required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.widht25(context),
          vertical: Dimensions.height10(context)),
      child: BinaryPoppinText(
          isBlack: false,
          text: text,
          fontSize: Dimensions.font16(context),
          weight: FontWeight.w600),
    );
  }

  Padding textData(String text, BuildContext context,
      {required bool isTrue, bool isDimensions = true, bool isSize = true}) {
    final Color isSwitching =
        isTrue == true ? Colors.white : Colors.white.withOpacity(.6);

    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.widht170(context),
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
