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




  // Height
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
  static double height30(context){
    return screenHeight(context)/27.56;
  }
  static double height45(context){
    return screenHeight(context)/18.38;
  }
  static double height50(context){
    return screenHeight(context)/16.54;
  }
  static double height100(context){
    return screenHeight(context)/8.27;
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
  static double height200(context){
    return screenHeight(context)/4.13;
  }
  static double height250(context){
    return screenHeight(context)/3.31;
  }



  // Widht
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
  static double widht100(context){
    return screenWidht(context)/3.93;
  }
  static double widht360(context){
    return screenWidht(context)/1.1;
  }



  // Font Size
  static double font5(context){
    return screenFont(context) * 4.38;
  }
  static double font10(context){
    return screenFont(context) * 8.696;
  }
  static double font12(context){
    return screenFont(context) * 10.435;
  }
  static double font14(context){
    return screenFont(context) * 12.17;
  }
  static double font16(context){
    return screenFont(context) * 13.913;
  }
  static double font20(context){
    return screenFont(context) * 17.391;
  }
  static double font28(context){
    return screenFont(context) * 24.347;
  }

  
  // Radius

}