import 'package:flutter/material.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({super.key});

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> with TickerProviderStateMixin{



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<Duration>(
          duration: const Duration(seconds: 30),
          tween: Tween(begin: const Duration(seconds: 30), end: Duration.zero),
          builder: (BuildContext context, Duration value, Widget? child) {
            var seconds = 30 - (value.inSeconds % 60);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text('${seconds<10 ? '0$seconds': seconds}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Aloevera",
                            fontSize: 16,
                            color: Color(0xFF363636),
                            fontWeight: FontWeight.w600
                          ))),
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F6FB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) * (seconds / 30), // Calculate the percentage of completion
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF8A00),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
        }),
        const Padding(
          padding: EdgeInsets.only(top: 4, bottom: 30),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("Resend", style: TextStyle(
              fontFamily: "Aloevera",
              fontSize: 16,
              color: Color(0xFF363636),
              fontWeight: FontWeight.w500
            ),),
          ),
        )
      ],
    );
  }
}