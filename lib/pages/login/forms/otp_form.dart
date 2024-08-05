import 'package:doctor_app/controller/login_controller.dart';
import 'package:doctor_app/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/colors_const.dart';
import '../animations/resend_timer.dart';

class OtpForm extends StatelessWidget {
  final int index;

  OtpForm({super.key, required this.index});

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: index == 2,
          child: Padding(
            padding: EdgeInsets.only(top: 16, bottom: height < 650 ? 10 : 40),
            child: Align(
              alignment: Alignment.center,
              child: Text("VERIFIED",
                  style: TextStyle(
                      color: ColorsConst.secondaryLight,
                      fontSize: TextResponsive.get(context, 26),
                      fontFamily: "Aloevera",
                      fontWeight: FontWeight.w700)),
            ),
          ),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Type In The, ",
              style: TextStyle(
                  color: ColorsConst.primary,
                  fontSize: TextResponsive.get(context, 32),
                  fontFamily: "Aloevera",
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: "OTP",
              style: TextStyle(
                  color: const Color(0xFF363636),
                  fontSize: TextResponsive.get(context, 32),
                  fontFamily: "Aloevera",
                  fontWeight: FontWeight.w600))
        ])),
        Padding(
            padding: EdgeInsets.only(bottom: 25, top: height < 650 ? 0 : 10),
            child: Text(
                "Enter The Four-Digit Code Sent To Your Phone & Email To Proceed.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: TextResponsive.get(context, 14),
                    ))),
        Padding(
          padding: EdgeInsets.only(bottom: height < 650 ? 8 : 20),
          child: Pinput(
            controller: loginController.otpController,
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            defaultPinTheme: PinTheme(
              width: height < 650 ? 60 : 70,
              height: height < 650 ? 40 : 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFF7F6FB),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        Visibility(visible: index == 1, child: const ResendTimer())
      ],
    );
  }
}
