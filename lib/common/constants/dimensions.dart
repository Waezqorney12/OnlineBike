import 'package:flutter/material.dart';

    // final logger = Logger();
    // logger.d("Height: ${MediaQuery.of(context).size.height}");
    // logger.d("Widht: ${MediaQuery.of(context).size.width}");
    // logger.d("Font Size: ${MediaQuery.of(context).textScaleFactor}");

    // My Device
    // Height: 826.9090909090909
    // Widht: 392.72727272727275
    // font: 1.15

    // Your Device

class Dimensions{

  // Current Height
  static double screenHeight(context){
    return MediaQuery.of(context).size.height;
  }
  // Current Widht
  static double screenWidht(context){
    return MediaQuery.of(context).size.width;
  }
  // Current Font
  static double screenFont(context){
    return MediaQuery.of(context).textScaleFactor;
  }

  // Minus Height
  static double minHeight25(BuildContext context){
    return screenHeight(context)/-33.08;
  }
  static double minHeight50(BuildContext context){
    return screenHeight(context)/-16.54;
  }
  static double minHeight70(BuildContext context){
    return screenHeight(context)/-11.81;
  }
  static double minHeight75(BuildContext context){
    return screenHeight(context)/-11.02;
  }

  static double minWidht100(context){
    return screenWidht(context)/-3.93;
  }
  static double minWidht150(context){
    return screenWidht(context)/-2.61;
  }
  static double minWidht200(context){
    return screenWidht(context)/-1.96;
  }


  // Height
  static double height0(BuildContext context){
    return screenHeight(context) * 0;
  }
  static double height5(BuildContext context){
    return screenHeight(context)/165.38;
  }
  static double height10(context){
    return screenHeight(context)/82.69;
  }
  static double height15(context){
    return screenHeight(context)/55.13;
  }
  static double height20(context){
    return screenHeight(context)/41.35;
  }
  static double height28(context){
    return screenHeight(context)/29.53;
  }
  static double height30(context){
    return screenHeight(context)/27.56;
  }
  static double height45(context){
    return screenHeight(context)/18.38;
  }
  static double height50(context){
    return screenHeight(context)/16.54;
  }
  static double height75(context){
    return screenHeight(context)/11.02;
  }
  static double height100(context){
    return screenHeight(context)/8.27;
  }
  static double height110(context){
    return screenHeight(context)/7.52;
  }
  static double height130(context){
    return screenHeight(context)/6.36;
  }
  static double height140(context){
    return screenHeight(context)/5.91;
  }
  static double height145(context){
    return screenHeight(context)/5.70;
  }
  static double height150(context){
    return screenHeight(context)/5.51;
  }
  static double height160(context){
    return screenHeight(context)/5.17;
  }
  static double height170(context){
    return screenHeight(context)/4.86;
  }
  static double height180(context){
    return screenHeight(context)/4.59;
  }
  static double height185(context){
    return screenHeight(context)/4.47;
  }
  static double height200(context){
    return screenHeight(context)/4.13;
  }
  static double height250(context){
    return screenHeight(context)/3.31;
  }



  // Widht
  static double widht0(context){
    return screenWidht(context) * 0;
  }
  static double widht5(context){
    return screenWidht(context)/78.55;
  }
  static double widht10(context){
    return screenWidht(context)/39.27;
  }
  static double widht15(context){
    return screenWidht(context)/26.18;
  }
  static double widht20(context){
    return screenWidht(context)/19.64;
  }
  static double widht25(context){
    return screenWidht(context)/15.71;
  }
  static double widht28(context){
    return screenWidht(context)/14.02;
  }
  static double widht30(context){
    return screenWidht(context)/13.09;
  }
  static double widht45(context){
    return screenWidht(context)/8.73;
  }
  static double widht50(context){
    return screenWidht(context)/7.85;
  }
  static double widht60(context){
    return screenWidht(context)/6.54;
  }
  static double widht100(context){
    return screenWidht(context)/3.93;
  }
  static double widht130(context){
    return screenWidht(context)/3.02;
  }
  static double widht140(context){
    return screenWidht(context)/2.80;
  }
  static double widht145(context){
    return screenWidht(context)/2.71;
  }
  static double widht160(context){
    return screenWidht(context)/2.45;
  }
  static double widht170(context){
    return screenWidht(context)/2.31;
  }
  static double widht200(context){
    return screenWidht(context)/1.96;
  }
  static double widht250(context){
    return screenWidht(context)/1.57;
  }
  static double widht360(context){
    return screenWidht(context)/1.1;
  }



  // Font Size
  static double font5(context){
    return screenFont(context) * 4.4;
  }
  static double font10(context){
    return screenFont(context) * 8.7;
  }
  static double font12(context){
    return screenFont(context) * 10.43;
  }
  static double font14(context){
    return screenFont(context) * 12.17;
  }
  static double font16(context){
    return screenFont(context) * 13.91;
  }
  static double font18(context){
    return screenFont(context) * 15.65;
  }
  static double font20(context){
    return screenFont(context) * 17.39;
  }
  static double font28(context){
    return screenFont(context) * 24.35;
  }


  // Radius

}