import 'package:flutter/material.dart';

import '../../../constants/colors_const.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: "Greetings, ", style: TextStyle(
                color: ColorsConst.primary,
                fontSize: 32,
                fontFamily: "Aloevera",
                fontWeight: FontWeight.w600
              )),
              TextSpan(text: "Doc!", style: TextStyle(
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
          child: Text("It's A Pleasure To Have You Join Us.", style: Theme.of(context).textTheme.bodySmall)),

        const Padding(
          padding: EdgeInsets.only(bottom: 13),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Registered Email ID"
            ),
          )),

        const Padding(
          padding: EdgeInsets.only(bottom: 13),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Registered Phone no."
            ),
          )),

        const Padding(
          padding: EdgeInsets.only(bottom: 28),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Onboarding Code"
            ),
          )),
      ],
    );
  }
}