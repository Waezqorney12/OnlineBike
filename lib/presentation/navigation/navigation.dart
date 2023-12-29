import 'package:bike_online_application/common/constants/colors.dart';
import 'package:bike_online_application/common/constants/dimensions.dart';
import 'package:bike_online_application/common/constants/image.dart';
import 'package:bike_online_application/presentation/Map/map.dart';
import 'package:bike_online_application/presentation/dashboard/dashboard.dart';
import 'package:bike_online_application/presentation/profile/profile.dart';
import 'package:bike_online_application/presentation/transaction/history.dart';
import 'package:bike_online_application/presentation/transaction/transaction.dart';
import 'package:flutter/material.dart';

class Navigations extends StatefulWidget {
  const Navigations({super.key});

  @override
  State<Navigations> createState() => _NavigationsState();
}

class _NavigationsState extends State<Navigations> {
  int currentindex = 0;
  final screen = const [
    Dashboard(),
    MapPage(),
    TransactionPage(),
    HistoryPage()
  ];

  void updateIndex(value) {
    setState(() {
      currentindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.darkGreen,
      body: screen[currentindex],
      bottomNavigationBar: SizedBox(
        height: Dimensions.height100(context),
        width: Dimensions.screenWidht(context),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            onTap: updateIndex,
            currentIndex: currentindex,
            showSelectedLabels: false,
            
            items: [
              barItem(
                  image: ImageClass.bicycles60,
                  imageBox: ImageClass.bicycles,
                  label: "Bicycles"),
              barItem(
                  image: ImageClass.maps60,
                  imageBox: ImageClass.maps,
                  label: "Maps"),
              barItem(
                  image: ImageClass.carts60,
                  imageBox: ImageClass.carts,
                  label: "Cart"),
              barItem(
                  image: ImageClass.documents60,
                  imageBox: ImageClass.documents,
                  label: "History"),
            ]),
      ),
    );
  }

  BottomNavigationBarItem barItem(
      {required String image,
      required String imageBox,
      required String label}) {
    return BottomNavigationBarItem(
        activeIcon: Container(
          transform: Matrix4.skewY(-.2),
          height: Dimensions.height50(context),
          width: Dimensions.widht50(context),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColorClass.lightBlue, ColorClass.darkBlue]),
              borderRadius: BorderRadius.circular(10)),
              child: Image.asset(imageBox),
        ),
        icon: Image.asset(image),
        label: label,
        backgroundColor: ColorClass.navDown);
  }
}
