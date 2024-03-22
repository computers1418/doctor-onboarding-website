import 'package:doctor_app/constants/colors_const.dart';
import 'package:doctor_app/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../shapes/triangle_shape.dart';


class Toast extends StatefulWidget {
  final String message;
  const Toast({super.key, required this.message});

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationUp;
  late Animation<double> _animationDown;
  Color _containerColor = ColorsConst.primary;
  Color _containerBgColor = const Color(0xFFFFF3E5);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Set the total duration for up and down
    );

    _animationUp = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.3, curve: Curves.easeInOut), // Use the first half for going up
      ),
    );

    _animationDown = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1, curve: Curves.easeInOut), // Use the second half for going down
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // Reverse the animation when it's completed
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(); // Start the animation again when it's dismissed
      }
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        // Change the color to the desired one
        _containerColor = Colors.white; 
        _containerBgColor = ColorsConst.primary; // Change it to your desired color
      });
    });

    _controller.forward(); // Start the animation initially
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -3 * _animationUp.value - 10 * _animationDown.value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),

            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _containerBgColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: _containerBgColor,
                        blurRadius: 4,
                        offset: const Offset(0, 0)
                      )
                    ]
                  ),
                  child: Text(
                    widget.message,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: TextResponsive.get(context, 12),
                      color: _containerColor, // Adjust the text color as needed
                      fontFamily: "Aloevera",
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                  ),
                ),
                Positioned(
                  left: 4,
                  bottom: 0,
                  child: CustomPaint(
                    painter: TrianglePainter(
                      strokeColor: _containerBgColor,
                      strokeWidth: 10,
                      paintingStyle: PaintingStyle.fill,
                    ),
                    child: const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}