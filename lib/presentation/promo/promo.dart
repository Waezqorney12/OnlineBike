import 'package:bike_online_application/common/component/AppBar.dart';
import 'package:bike_online_application/common/component/Font/BinaryPoppinText.dart';
import 'package:bike_online_application/common/component/Font/PoppinText.dart';
import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:flutter/material.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(text: 'Promo'),
      backgroundColor: ColorClass.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.widht20(context),
              vertical: Dimensions.height20(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Voucher and subscription
              Row(
                children: [
                  voucher(context,
                      color: ColorClass.lightBlue,
                      text: 'Voucher & packs',
                      qty: '0'),
                  SizedBox(width: Dimensions.widht10(context)),
                  voucher(context,
                      color: ColorClass.blueStatus,
                      text: 'Subscriptions',
                      qty: '0'),
                ],
              ),

              // Enter Promo
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height20(context)),
                child: Container(
                  height: Dimensions.height50(context),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorClass.background,
                      boxShadow: [
                        BoxShadow(
                          color: ColorClass.white.withOpacity(.2),
                          spreadRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.widht20(context)),
                        child: SizedBox(
                          height: Dimensions.height25(context),
                          width: Dimensions.widht25(context),
                          child: Image.asset(ImageClass.promo),
                        ),
                      ),
                      BinaryPoppinText(
                        text: 'Got a voucher code? Enter here',
                        fontSize: Dimensions.font14(context),
                        weight: FontWeight.w500,
                        isBlack: false,
                      ),
                      Expanded(
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: ColorClass.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //Sub Header Items
              subHeader(context,text: 'Top rated items'),
              // Container Packages
              boxItem(context),

              //Sub Header Voucher       
              subHeader(context, text: 'Flash sale vouchers'),
            ],
          ),
        ),
      ),
    );
  }

  Padding boxItem(BuildContext context) {
    return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height10(context)),
              child: Container(
                height: Dimensions.height220(context),
                width: Dimensions.widht170(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorClass.background,
                    boxShadow: [
                      BoxShadow(
                          color: ColorClass.white.withOpacity(.2),
                          spreadRadius: 1,
                          blurRadius: 3)
                    ]),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: Dimensions.height130(context),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageClass.helm)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height20(context),
                          horizontal: Dimensions.widht15(context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PoppinText(
                              text: 'Road Helmet',
                              fontSize: Dimensions.font12(context),
                              weight: FontWeight.normal,
                              color: Colors.grey),
                          BinaryPoppinText(
                              text: 'SMITH - TRADE',
                              fontSize: Dimensions.font16(context),
                              weight: FontWeight.bold,
                              isBlack: false),
                          SizedBox(height: Dimensions.height10(context)),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: Dimensions.font16(context),
                              ),
                              SizedBox(width: Dimensions.widht10(context)),
                              BinaryPoppinText(
                                text: '4.7',
                                fontSize: Dimensions.font12(context),
                                weight: FontWeight.w500,
                                isBlack: false,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: Dimensions.height10(context),
                      left: Dimensions.minWidht10(context),
                      child: Container(
                        width: Dimensions.widht90(context),
                        height: Dimensions.height35(context),
                        decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Dimensions.height5(context),
                              left: Dimensions.widht10(context)),
                          child: BinaryPoppinText(
                            text: '75% off',
                            fontSize: Dimensions.font16(context),
                            weight: FontWeight.bold,
                            isBlack: false,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: Dimensions.minWidht10(context),
                      top: Dimensions.height45(context),
                      child: ClipPath(
                        clipper: MyCustomClipper(),
                        child: Container(
                          height: Dimensions.height10(context),
                          width: Dimensions.widht10(context),
                          color: Colors.red[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }

  Widget subHeader(BuildContext context,{required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height10(context)),
      child: BinaryPoppinText(
                  text: text,
                  fontSize: Dimensions.font18(context),
                  weight: FontWeight.bold,
                  isBlack: false),
    );
  }

  Expanded voucher(BuildContext context,
      {required Color color, required String qty, required String text}) {
    return Expanded(
      child: Container(
        height: Dimensions.height100(context),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorClass.background,
            boxShadow: [
              BoxShadow(
                  color: ColorClass.white.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.widht10(context),
              vertical: Dimensions.height10(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BinaryPoppinText(
                    text: qty,
                    fontSize: Dimensions.font20(context),
                    weight: FontWeight.bold,
                    isBlack: false,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: ColorClass.white,
                  )
                ],
              ),
              BinaryPoppinText(
                text: text,
                fontSize: Dimensions.font14(context),
                weight: FontWeight.w500,
                isBlack: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height15(context)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: Dimensions.height5(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
