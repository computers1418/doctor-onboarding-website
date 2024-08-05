import 'dart:math';

import 'package:doctor_app/controller/login_controller.dart';
import 'package:doctor_app/pages/login/animations/title_image.dart';
import 'package:doctor_app/pages/login/animations/toast_widget.dart';
import 'package:doctor_app/pages/login/forms/login_form.dart';
import 'package:doctor_app/pages/login/forms/otp_form.dart';
import 'package:doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../constants/colors_const.dart';
import '../../responsive/text_responsive.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  LoginController loginController = Get.put(LoginController());
  FToast? fToast;

  @override
  void initState() {
    fToast = FToast();
    fToast!.init(context);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    //   statusBarColor: Colors.white.withOpacity(0.6),
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) => Column(
              children: [
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height < 650 ? 160 : 200,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 240,
                              child: TitleImage(
                                animation: _animation,
                                controller: _controller,
                              ),
                            ),
                            controller.index != 0
                                ? AppBar(
                                    backgroundColor: Colors.transparent,
                                    automaticallyImplyLeading: false,
                                    toolbarHeight: 70,
                                    title: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Container(
                                              width: 50,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: ColorsConst
                                                      .secondaryLight),
                                              child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      loginController
                                                          .clearTextField();
                                                      if (controller.index ==
                                                          1) {
                                                        _controller =
                                                            AnimationController(
                                                          vsync: this,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                        );
                                                        _animation = Tween<
                                                                    double>(
                                                                begin: pi / 2,
                                                                end: 0)
                                                            .animate(
                                                                _controller);
                                                        // index = 0;
                                                        loginController
                                                            .changeIndex(0);
                                                      } else {
                                                        _controller =
                                                            AnimationController(
                                                          vsync: this,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                        );
                                                        _animation = Tween<
                                                                    double>(
                                                                begin: pi,
                                                                end: pi / 2)
                                                            .animate(
                                                                _controller);
                                                        // index = 1;
                                                        loginController
                                                            .changeIndex(1);
                                                      }
                                                    });

                                                    _controller.forward();
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_back,
                                                    color: Colors.white,
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(top: 12),
                                              child: ToastWidget(
                                                message:
                                                    "If You Go Back, You'll Need To Log In Again.",
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            controller.index == 0
                                ? LoginForm()
                                : OtpForm(index: controller.index),
                            Visibility(
                                visible: height > 700 && width < 450,
                                child: const SizedBox(
                                  height: 40,
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (controller.index == 0) {
                                      loginController.generateOtpApi(
                                        context,
                                        body: {
                                          "email": loginController
                                              .emailController.text,
                                          "code": loginController
                                              .onboardingController.text,
                                          "phone": loginController
                                              .phoneController.text
                                        },
                                        fToast: fToast!,
                                        function: () {
                                          loginController.changeIndex(1);
                                          _controller = AnimationController(
                                            vsync: this,
                                            duration: const Duration(
                                                milliseconds: 800),
                                          );
                                          _animation = Tween<double>(
                                                  begin: 0, end: pi / 2)
                                              .animate(_controller);
                                          // index = 1;
                                          _controller.forward();
                                        },
                                      );
                                    } else if (controller.index == 1) {
                                      loginController.otpValidateApi(
                                        context,
                                        body: {
                                          "id": controller.loginId,
                                          "otp": controller.otpController.text
                                        },
                                        fToast: fToast!,
                                        function: () {
                                          loginController.changeIndex(2);
                                          _controller = AnimationController(
                                            vsync: this,
                                            duration: const Duration(
                                                milliseconds: 800),
                                          );
                                          _animation = Tween<double>(
                                                  begin: pi / 2, end: pi)
                                              .animate(_controller);
                                          // index = 2;
                                          _controller.forward();
                                        },
                                      );
                                    } else {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          Routes.accountCreate,
                                          (route) => false);
                                    }
                                  });
                                },
                                child: Text(
                                  controller.index == 0
                                      ? "LOGIN"
                                      : controller.index == 1
                                          ? "VERIFY"
                                          : "DONE",
                                  style: TextStyle(
                                    fontSize: TextResponsive.get(context, 14),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height >= 800
                      ? MediaQuery.of(context).size.width * 0.6
                      : MediaQuery.of(context).size.width * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: -2 * MediaQuery.of(context).size.width / 2.5,
                        bottom: -2 * MediaQuery.of(context).size.width +
                            (height >= 800 ? 340 : 240),
                        child: CircleAvatar(
                          backgroundColor: ColorsConst.secondaryLight,
                          radius: MediaQuery.of(context).size.width * 0.8,
                        ),
                      ),
                      Positioned(
                        right: -2 * MediaQuery.of(context).size.width / 2.5,
                        bottom: -2 * MediaQuery.of(context).size.width +
                            (height >= 800 ? 340 : 240),
                        child: CircleAvatar(
                          backgroundColor: ColorsConst.secondary,
                          radius: MediaQuery.of(context).size.width * 0.8,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
