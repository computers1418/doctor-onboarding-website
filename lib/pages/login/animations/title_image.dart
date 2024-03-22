import 'dart:math';

import 'package:flutter/material.dart';

class TitleImage extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> animation;
  const TitleImage({super.key, required this.animation, required this.controller});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        
        Positioned(
          // right: -2*MediaQuery.of(context).size.width/2,
          bottom: 0,
          child: AnimatedBuilder(
            animation: animation,
            builder: (_, child) {
              return Transform.rotate(
                angle: animation.value,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).size.width*0.9,
                  child: Stack(
                    children: [
                      Transform.flip(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: height<650 ? 110 :160, height: height<650 ? 110 :160,
                            child: Image.asset("res/images/3d-connect.png"),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: height<650 ? 110 :160, height: height<650 ? 110 :160,
                          child: Transform.rotate(
                            angle: -pi/2,
                            child: Image.asset("res/images/3d-otp.png"),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: height<650 ? 70 :100, height: height<650 ? 70 :100,
                          child: Transform.rotate(
                            angle: pi,
                            child: Image.asset("res/images/3d-success.png")),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ],
    // ),
        );
  }
}