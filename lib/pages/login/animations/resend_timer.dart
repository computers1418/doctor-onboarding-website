import 'package:doctor_app/controller/login_controller.dart';
import 'package:doctor_app/responsive/text_responsive.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({super.key});

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final int _maxResendCount = 2;
  int _resendCount = 0;
  LoginController loginController = Get.put(LoginController());
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..forward(); // Start the animation initially
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _restartTimer() {
    if (_resendCount < _maxResendCount) {
      loginController.generateOtpApi(
        context,
        body: {
          "email": loginController.emailController.text,
          "code": loginController.onboardingController.text,
          "phone": loginController.phoneController.text
        },
        fToast: fToast!,
        function: () {
          setState(() {
            _resendCount++;
          });
          _controller.reset();
          _controller.forward();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            var seconds = (30 - _controller.value * 30).ceil();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '${seconds < 10 ? '0$seconds' : seconds}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Aloevera",
                      fontSize: TextResponsive.get(context, 16),
                      color: const Color(0xFF363636),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
                        width: (MediaQuery.of(context).size.width - 60) *
                            _controller.value, // Adjust progress
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
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 4, bottom: height < 650 ? 8 : 30),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _restartTimer,
              child: Text(
                "Resend",
                style: TextStyle(
                  fontFamily: "Aloevera",
                  fontSize: TextResponsive.get(context, 16),
                  color: const Color(0xFF363636),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
