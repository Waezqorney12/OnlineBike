import 'package:bike_online_application/bloc/dashboard/dashboard_bloc.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math' show pi;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser;

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    context
        .read<DashboardBloc>()
        .add(LoadProfile(email: user?.email.toString() ?? ""));

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: PoppinText(
              text: "Bicycle Store",
              fontSize: Dimensions.font28(context),
              weight: FontWeight.bold,
              color: Colors.white.withOpacity(.7)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Dimensions.height75(context)),
            child: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height20(context),
                  ),
                  child: Container(
                    height: Dimensions.height45(context),
                    width: MediaQuery.of(context).size.width -
                        Dimensions.widht30(context),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorClass.darkBlue),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.pedal_bike_outlined,
                              color: Colors.grey,
                            )),
                        Expanded(
                          flex: 7,
                          child: PoppinText(
                            text: "Bicycle, Helmet, Shoes",
                            fontSize: Dimensions.font14(context),
                            weight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.widht10(context),
                          ),
                          child: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          elevation: 5,
          backgroundColor: ColorClass.backgroundAppbar,
          actions: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.widht15(context)),
              child: BlocConsumer<DashboardBloc, DashboardState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ProfileInitial) {
                    // Display loading or default content while profile is being fetched
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProfileLoaded) {
                    String imageUrl = state.profile.gambarProfile ?? " ";
                    return IconButton(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/Profile'),
                        icon: Container(
                          width: Dimensions.height50(context),
                          height: Dimensions.height50(context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageUrl.contains(" ")
                                      // ignore: unnecessary_cast
                                      ? const AssetImage(ImageClass.defaultPictureProfile) as ImageProvider<Object>
                                      // ignore: unnecessary_cast
                                      : NetworkImage(imageUrl) as ImageProvider<Object> )),
                        ));
                  } else if (state is ProfileError) {
                    return BinaryPoppinText(
                        text: state.errorMessage,
                        fontSize: Dimensions.font12(context),
                        weight: FontWeight.bold);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
        backgroundColor: ColorClass.background,
        body: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) => Transform(
                      transform: Matrix4.identity()..rotateZ(animation.value),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Center condition(BuildContext context, {required String text}) {
    return Center(
      child: BinaryPoppinText(
        text: text,
        fontSize: Dimensions.font14(context),
        weight: FontWeight.bold,
        isBlack: false,
      ),
    );
  }
}
