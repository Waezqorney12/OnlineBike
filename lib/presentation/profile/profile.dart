import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/HiddenText.dart';
import 'package:bike_online_application/common/component/Font/InterText.dart';
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
                  textData(data!.nama.toString(), context,
                      isTrue: true, isDimensions: false, isSize: false),
                  textData(data.status.toString(), context,
                      isTrue: false, isSize: false),
                  SizedBox(height: Dimensions.height20(context)),
                  subText(context, text: "Personal Information"),
                  boxInformation(
                      emailInformation: data.email.toString(),
                      alamatInformation: data.alamat.toString(),
                      nomorInformation: data.nomorTelepon.toString()),
                  subText(context, text: "Credit Card"),
                  boxCredit(
                      cardName: data.nama!.toUpperCase(),
                      numberCard: "0000 0000 0000 0000",
                      expiredCard: "09/28")
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
      width: Dimensions.height130(context),
      height: Dimensions.height130(context),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorClass.background, // Setel warna shadow menjadi transparan
          spreadRadius: Dimensions.widht10(
              context), // Atur spreadRadius sesuai dengan lebar border
        ),
      ], shape: BoxShape.circle, image: image),
    );
  }

  Padding boxInformation(
      {required String emailInformation,
      required String alamatInformation,
      required String nomorInformation}) {
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
        child: Column(
          children: [
            detailInformation(
                information: emailInformation,
                icons: Icons.email_outlined,
                subText: "Email Address"),
            detailInformation(
                information: alamatInformation,
                icons: Icons.map,
                subText: "Adress"),
            detailInformation(
                information: nomorInformation,
                icons: Icons.phone_in_talk_outlined,
                subText: "Phone Number"),
          ],
        ),
      ),
    );
  }

  Padding detailInformation(
      {required String information,
      required String subText,
      required IconData icons}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height15(context)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              icons,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              width: Dimensions.widht145(context),
              child: BinaryPoppinText(
                  text: subText,
                  fontSize: Dimensions.font12(context),
                  weight: FontWeight.w600,
                  isBlack: false,
                ),
              
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: Dimensions.widht15(context)),
            child: HiddenText(context: context, text: information))
        ],
      ),
    );
  }

  Padding boxCredit(
      {required String cardName,
      required String expiredCard,
      required String numberCard}) {
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
            cardNumberInfo(text: numberCard),
            cardInformation(text: cardName),
            cardExpired(text: expiredCard),
            logoCard(left: Dimensions.widht15(context)),
            logoCard(isDefault: false, left: Dimensions.widht30(context)),
            gradientCreditCart(
                color: ColorClass.effectCard.withOpacity(.25),
                right: Dimensions.minWidht100(context)),
            gradientCreditCart(
                color: ColorClass.effectCard.withOpacity(.25),
                right: Dimensions.minWidht150(context)),
            gradientCreditCart(
                color: ColorClass.effectCard.withOpacity(.35),
                right: Dimensions.minWidht200(context)),
            Positioned(
                right: Dimensions.widht15(context),
                bottom: Dimensions.height15(context),
                child: SizedBox(
                    height: Dimensions.height30(context),
                    width: Dimensions.widht45(context),
                    child: Image.asset(ImageClass.chip))),
          ],
        ),
      ),
    );
  }

  Positioned cardNumberInfo({required String text}) {
    return positionCardInformation(
        text: text,
        bottom: Dimensions.height75(context),
        fontSize: Dimensions.font20(context),
        fontWeight: FontWeight.bold);
  }

  Positioned cardInformation({required String text}) {
    return positionCardInformation(
        bottom: Dimensions.height30(context),
        fontSize: Dimensions.font12(context),
        fontWeight: FontWeight.w600,
        text: text);
  }

  Positioned cardExpired({required String text}) {
    return positionCardInformation(
        bottom: Dimensions.height10(context),
        fontSize: Dimensions.font12(context),
        fontWeight: FontWeight.w600,
        text: text);
  }

  Positioned positionCardInformation(
      {required String text,
      required double bottom,
      required double fontSize,
      required FontWeight fontWeight}) {
    return Positioned(
        bottom: bottom,
        left: Dimensions.widht15(context),
        child: Column(
          children: [
            InterFont(
                text: text,
                fontSize: fontSize,
                fontWeight: fontWeight,
                colors: ColorClass.background),
          ],
        ));
  }

  Positioned logoCard({bool isDefault = true, required double left}) {
    return Positioned(
      top: Dimensions.height10(context),
      left: left,
      child: Container(
        height: Dimensions.height28(context),
        width: Dimensions.widht28(context),
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
      top: Dimensions.minHeight25(context),
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
