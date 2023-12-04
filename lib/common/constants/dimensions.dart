import 'package:flutter/material.dart';

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