import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/colors_const.dart';
import '../animations/resend_timer.dart';

class OtpForm extends StatelessWidget {
  final int index;
  const OtpForm({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: index==2,
          child: const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 40),
            child: Align(
              alignment: Alignment.center,
              child: Text("VERIFIED", style: TextStyle(
                color: ColorsConst.secondaryLight,
                fontSize: 26,
                fontFamily: "Aloevera",
                fontWeight: FontWeight.w700
              )),
            ),
          ),
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: "Type In The, ", style: TextStyle(
                color: ColorsConst.primary,
                fontSize: 32,
                fontFamily: "Aloevera",
                fontWeight: FontWeight.w600
              )),
              TextSpan(text: "OTP", style: TextStyle(
                color: Color(0xFF363636),
                fontSize: 32,
                fontFamily: "Aloevera",
                fontWeight: FontWeight.w600
              ))
            ]
          )
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 25, top: 10),
          child: Text("Enter The Four-Digit Code Sent To Your Phone & Email To Proceed.", style: Theme.of(context).textTheme.bodySmall)),

        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Pinput(
            length: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            defaultPinTheme: PinTheme(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F6FB),
                borderRadius: BorderRadius.circular(30)
              ),
            ),
          ),
        ),

        Visibility(
          visible: index==1,
          child: const ResendTimer())

      ],
    );
  }
}