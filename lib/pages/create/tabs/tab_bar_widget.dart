import 'dart:math';

import 'package:doctor_app/pages/create/account_create_viewmodel.dart';
import 'package:doctor_app/shapes/right_triangle_shape.dart';
import 'package:flutter/material.dart';

import '../../../responsive/text_responsive.dart';

class TabBarWidget extends StatelessWidget {
  final AccountCreateViewModel viewModel;
  const TabBarWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel.selectedTab,
      builder: (_, value, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFF20AFA9),
                        borderRadius: BorderRadius.horizontal( left: Radius.circular(15))
                      ),
                      child: Text('Details', style: TextStyle(
                        fontFamily: "Kumbhsans",
                        fontSize: TextResponsive.get(context, 12),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                    ),
                    
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: value>0 ? const Color(0xFF2EC4BE): const Color(0xFFECE9F6),
                        borderRadius: BorderRadius.circular(0)
                      ),
                      child: Text('Expertise', style: TextStyle(
                        fontFamily: "Kumbhsans",
                        fontSize: TextResponsive.get(context, 12),
                        fontWeight: FontWeight.w500,
                        color: value>0 ? Colors.white: const Color(0xFFA499CA),
                      )),
                    ),
        
                    Positioned(
                      left: -7,
                      bottom: 6,
                      child: Transform.rotate(
                            angle: pi/2,
                            child: CustomPaint(
                                painter: RightTrianglePainter(
                                  strokeColor: const Color(0xFF20AFA9),
                                  strokeWidth: 20,
                                  paintingStyle: PaintingStyle.fill,
                                ),
                                child: const SizedBox(
                                  height: 20,
                                  width: 32,
                                ),
                              ),
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: value==2 ? const Color(0xFF3FDAD3): const Color(0xFFECE9F6),
                        border: Border(
                          left: BorderSide( // Adjust these properties as needed
                            color: value>0 ? const Color(0xFF2EC4BE): const Color(0xFFECE9F6), // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        borderRadius: const BorderRadius.horizontal( right: Radius.circular(15))
                      ),
                      child: Text('Address', style: TextStyle(
                        fontFamily: "Kumbhsans",
                        fontSize: TextResponsive.get(context, 12),
                        fontWeight: FontWeight.w500,
                        color: value==2 ? Colors.white: const Color(0xFFB4ABD7),
                      )),
                    ),
                    Positioned(
                      left: -6,
                      bottom: 5,
                      child: Transform.rotate(
                            angle: pi/2,
                            child: CustomPaint(
                                painter: RightTrianglePainter(
                                  strokeColor: value>0 ? const Color(0xFF2EC4BE): const Color(0xFFECE9F6),
                                  strokeWidth: 20,
                                  paintingStyle: PaintingStyle.fill,
                                ),
                                child: const SizedBox(
                                  height: 20,
                                  width: 32,
                                ),
                              ),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}