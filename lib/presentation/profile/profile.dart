import 'package:bike_online_application/bloc/profile/profile_bloc.dart';
import 'package:bike_online_application/common/component/AppBar.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _user = FirebaseAuth.instance.currentUser;

  final ProfileBloc profileBloc = ProfileBloc();
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
        appBar: const MyAppBar(path: '/Navigation', text: 'My Profile'),
        backgroundColor: ColorClass.background,
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Column(
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
                              child: state.profile.gambarProfile.toString() ==
                                      "Udentified picture"
                                  ? profilePicture(context,
                                      image: const DecorationImage(
                                          image: AssetImage(ImageClass
                                              .defaultPictureProfile)))
                                  : profilePicture(context,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(state
                                              .profile.gambarProfile
                                              .toString())))),
                        ],
                      ),
                    ),
                    textData(state.profile.nama.toString(), context,
                        isTrue: true, isDimensions: false, isSize: false),
                    textData(state.profile.status.toString(), context,
                        isTrue: false, isSize: false),
                    SizedBox(height: Dimensions.height20(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.widht25(context),
                          vertical: Dimensions.height10(context)),
                      child: PoppinText(
                          color: ColorClass.white,
                          text: "Account",
                          fontSize: Dimensions.font16(context),
                          weight: FontWeight.w600),
                    ),
                    account(context,
                        image: ImageClass.setting,
                        path: '/Costum',
                        text: "Costum Account"),
                    account(context,
                        image: ImageClass.history,
                        path: '/Dashboard',
                        text: 'Order History'),
                    account(context,
                        image: ImageClass.promo,
                        path: '/Dashboard',
                        text: 'Promos'),
                    account(context,
                        image: ImageClass.card,
                        path: '/Dashboard',
                        text: 'Payment Method'),
                    account(context,
                        image: ImageClass.information,
                        path: '/Dashboard',
                        text: "Help"),
                    account(context,
                        image: ImageClass.globe,
                        path: '/Dashboard',
                        text: "Change Language"),
                    account(context,
                        image: ImageClass.linked,
                        path: '/Manage',
                        text: "Manage Account"),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(
                child: BinaryPoppinText(
                    text: state.errorMessage,
                    fontSize: Dimensions.font14(context),
                    weight: FontWeight.bold,
                    isBlack: false),
              );
            } else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget account(BuildContext context,
      {required String text, required String image, required String path}) {
    return InkWell(
      highlightColor: ColorClass.white.withOpacity(.7),
      splashColor: ColorClass.darkBlue.withOpacity(.4),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(path);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height5(context)),
        child: ListTile(
          leading: Container(
            height: Dimensions.height45(context),
            width: Dimensions.widht45(context),
            decoration: BoxDecoration(
                color: ColorClass.backgroundIcon,
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(image))),
          ),
          title: PoppinText(
            text: text,
            fontSize: 14,
            weight: FontWeight.w500,
            color: ColorClass.white,
          ),
          trailing: Icon(
            size: Dimensions.font20(context),
            Icons.arrow_forward_ios_rounded,
            color: ColorClass.white,
          ),
        ),
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
