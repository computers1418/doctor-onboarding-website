import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../responsive/text_responsive.dart';
import 'colors_const.dart';

showToast(BuildContext context, FToast fToast, String text, bool error) {
  return fToast.showToast(
    toastDuration: Duration(seconds: 3),
    child: Container(
      decoration: BoxDecoration(
          color: HexColor("#222425"), borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.only(top: 11, bottom: 15, left: 20, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(text,
                style: TextStyle(
                    color: error ? HexColor("#FF7171") : HexColor("#71FF7F"),
                    fontSize: TextResponsive.get(context, 10),
                    fontFamily: "Aloevera",
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            width: 12,
          ),
          Image.asset("res/images/close.png",
              width: 20,
              height: 20,
              color: error ? HexColor("#FF7171") : HexColor("#71FF7F"))
        ],
      ),
    ),
    gravity: ToastGravity.BOTTOM,
  );
}
