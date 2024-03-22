import 'package:flutter/material.dart';

class CResponsive {

  static heightVisibleOnMax(BuildContext context, size ){
    var height = MediaQuery.of(context).size.height;
    return height > 870 ? size : 0;
  }

}