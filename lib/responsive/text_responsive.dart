import 'package:flutter/material.dart';

class TextResponsive {

  static getSizeFactor(BuildContext context, fontSize){
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    if(screenWidth < 350){

      return fontSize>=20 ? 0.75 :  0.85;
    }else if(screenWidth < 420){
      return 0.9;
    }else if(screenWidth < 460){
      return 1;
    }else if(screenWidth < 460 && screenHeight>850){
      return 1.2;
    }else{
      return 1;
    }
  }

  static get(BuildContext context, fontSize){
    return fontSize * getSizeFactor(context, fontSize);
  }

}