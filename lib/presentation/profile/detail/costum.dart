// ignore_for_file: unused_import

import 'dart:io';

import 'package:bike_online_application/bloc/profile/profile_bloc.dart';
import 'package:bike_online_application/common/component/AppBar.dart';
import 'package:bike_online_application/common/component/Button_Login_Register.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/HiddenText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/model/auth/profile.dart';
import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:bike_online_application/repository/firebase/profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CostumAccountPage extends StatefulWidget {
  const CostumAccountPage({super.key});

  @override
  State<CostumAccountPage> createState() => _CostumAccountPageState();
}

class _CostumAccountPageState extends State<CostumAccountPage> {
  Logger logger = Logger();
  final _user = FirebaseAuth.instance.currentUser;
  final ProfileBloc profileBloc = ProfileBloc();

  String imageUrl = '';
  @override
  void initState() {
    context
        .read<ProfileBloc>()
        .add(LoadProfile(email: _user?.email.toString() ?? ""));
    super.initState();
  }

  @override
  void dispose() {
    profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(path: '/Profile', text: 'Costums Account'),
      backgroundColor: ColorClass.background,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
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
                        child: GestureDetector(
                          onTap: () async {
                            final file = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            file.validation();

                            final fileName = DateTime.now()
                                .microsecondsSinceEpoch
                                .toString();

                            Reference reference =
                                FirebaseStorage.instance.ref();
                            Reference referenceDireImages =
                                reference.child('images');

                            Reference referenceImageToUpload =
                                referenceDireImages.child(fileName);
                            try {
                              if (file?.path.isNotEmpty ?? false) {
                                await referenceImageToUpload
                                    .putFile(File(file!.path));
                                imageUrl = await referenceImageToUpload
                                    .getDownloadURL();
                                    
                              } else {
                                logger.d('File path is empty');
                              }
                            } catch (e) {
                              logger.d(e.toString());
                            }
                          },
                          child: state.profile.gambarProfile.toString() ==
                                  "Udentified picture"
                              ? profilePicture(context,
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          ImageClass.defaultPictureProfile)))
                              : profilePicture(context,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(state
                                          .profile.gambarProfile
                                          .toString()))),
                        ),
                      ),
                      Positioned(
                          bottom: Dimensions.minHeight75(context),
                          left: Dimensions.widht90(context),
                          child: Icon(
                            Icons.camera_enhance_rounded,
                            size: Dimensions.font28(context),
                            color: Colors.white,
                          ))
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
                    icon: Icons.email,
                    title: state.profile.email.toString(),
                    isTrailing: false),
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, '/Name'),
                  child: menu(context,
                      icon: Icons.person, title: state.profile.nama.toString()),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/Address'),
                  child: menu(context,
                      icon: Icons.maps_home_work_rounded,
                      title: state.profile.alamat.toString()),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/Phone'),
                  child: menu(context,
                      icon: Icons.phone,
                      title: state.profile.nomorTelepon.toString()),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height50(context),
                      horizontal: Dimensions.widht15(context)),
                  child: ButtonFormat(
                      text: 'Save profile',
                      buttonPressed: () {
                        PersonalInformation().changeProfilePicture(
                            context, imageUrl, state.profile.email.toString());
                      }),
                )
              ],
            );
          } else if (state is ProfileError) {
            return Center(
                child: BinaryPoppinText(
                    text: state.errorMessage,
                    fontSize: Dimensions.font20(context),
                    weight: FontWeight.bold));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
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
          trailing: widget),
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

  Future<void> selectImage() async {
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
      } else {
        logger.d('File path is empty');
      }
    } catch (e) {
      logger.d(e.toString());
    }
  }
}
