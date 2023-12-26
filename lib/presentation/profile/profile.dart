import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/HiddenText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/data/model/auth/profile.dart';
import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          future: RegisterAuth().getUserProfile(
              email: user?.email.toString() ?? "Udentified email",
              context: context),
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.widht25(context),
                        vertical: Dimensions.height10(context)),
                    child: BinaryPoppinText(
                        isBlack: false,
                        text: "Personal Information",
                        fontSize: Dimensions.font16(context),
                        weight: FontWeight.w600),
                  ),
                  boxInformation(
                      emailInformation: data.email.toString(),
                      alamatInformation: data.alamat.toString(),
                      nomorInformation: data.nomorTelepon.toString()),
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
      padding: EdgeInsets.symmetric(vertical: Dimensions.height15(context)),
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

  Padding textData(String text, BuildContext context,
      {required bool isTrue, bool isDimensions = true, bool isSize = true}) {
    final Color isSwitching =
        isTrue == true ? Colors.white : Colors.white.withOpacity(.6);

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
