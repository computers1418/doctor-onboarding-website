import 'package:doctor_app/responsive/text_responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors_const.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Greetings, ", style: TextStyle(
                color: ColorsConst.primary,
                fontSize: TextResponsive.get(context, 32),
                fontFamily: "Aloevera",
                fontWeight: FontWeight.w600
              )),
              TextSpan(text: "Doc!", style: TextStyle(
                color: const Color(0xFF363636),
                fontSize: TextResponsive.get(context, 32),
                fontFamily: "Aloevera",
                fontWeight: FontWeight.w600
              ))
            ]
          )
        ),

        Padding(
          padding: EdgeInsets.only(bottom: height<650 ? 8:25, top: height<650 ? 0 : 10),
          child: Text("It's A Pleasure To Have You Join Us.", style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: TextResponsive.get(context, 14),
          ))),

        SizedBox(
          height: 60,
          child: TextField(
            style: TextStyle(
              height: 1,
              fontSize: TextResponsive.get(context, 14),
            ),
            decoration: InputDecoration(
              hintText: "Registered Email ID",
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                fontSize: TextResponsive.get(context, 14),
                height: 1
              ),
            ),
          ),
        ),

        SizedBox(
          height: 60,
          child: TextField(
            style: TextStyle(
              height: 1,
              fontSize: TextResponsive.get(context, 14),
            ),
            decoration: InputDecoration(
              hintText: "Registered Phone no.",
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                fontSize: TextResponsive.get(context, 14),
                height: 1
              ),
            ),
          ),
        ),

        SizedBox(
          height: 60,
          child: TextField(
            style: TextStyle(
              height: 1,
              fontSize: TextResponsive.get(context, 14),
            ),
            decoration: InputDecoration(
              hintText: "Onboarding Code",
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
                fontSize: TextResponsive.get(context, 14),
                height: 1
              ),
            ),
          ),
        ),
      ],
    );
  }
}