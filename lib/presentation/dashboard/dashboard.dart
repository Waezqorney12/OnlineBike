import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/InterText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        appBar: AppBar(
          title: PoppinText(text: "Bicycle Store", fontSize: Dimensions.font28(context), weight: FontWeight.bold, color: Colors.white.withOpacity(.7)),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height75(context)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height20(context)),
                child: Container(
                  height: Dimensions.height45(context),
                  width: MediaQuery.of(context).size.width -
                      Dimensions.widht30(context),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorClass.darkBlue),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 2,
                        child:  Icon(
                              Icons.bike_scooter,
                              color: Colors.grey,
                            ),
                      ),
                      Expanded(
                        flex: 7,
                        child: PoppinText(
                            text: "Bicycle, Helmet, Shoes",
                            fontSize: Dimensions.font14(context),
                            weight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.widht10(context)),
                        child: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          elevation: 5,
          backgroundColor: ColorClass.backgroundAppbar,
          actions: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.widht15(context)),
              child: IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                      backgroundColor: ColorClass.white,
                      child: Image.asset(ImageClass.personsBlack))),
            )
          ],
        ),
        backgroundColor: ColorClass.background,
        body: FutureBuilder(
          future: RegisterAuth().getUserProfile(
              email: user?.email ?? "Udentified email", context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: condition(context, text: "Snapshot Error"));
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [],
                ),
              );
            } else {
              return condition(context, text: "Something went wrong");
            }
          },
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
