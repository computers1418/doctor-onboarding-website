import 'dart:math';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:doctor_app/constants/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../api/api_middle_wear_api.dart';
import '../constants/custom_print.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController onboardingController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  int index = 0;
  String loginId = "";

  changeIndex(int value) {
    index = value;
    update();
  }

  clearTextField() {
    emailController.clear();
    phoneController.clear();
    onboardingController.clear();
    otpController.clear();
  }

  Future<bool> generateOtpApi(BuildContext context,
      {required Map<String, dynamic> body,
      required FToast fToast,
      required VoidCallback function}) async {
    // creatingCity.value = true;
    try {
      Map<String, dynamic> data = body;
      final response = await ApiMiddleWear(
        url: ApiConstant.otpGenerateUrl,
        data: data,
      ).post(
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.statusCode == 200) {
        // if (response.data["data"] != null) {
        showToast(context, fToast, response.data["message"], false);
        loginId = response.data["data"];
        update();
        function();

        return true;
        // }
      } else {
        showToast(context, fToast, response.data["message"], true);
      }
    } catch (e) {
      // printC('error:$e');
    } finally {
      // creatingCity.value = false;
    }
    return false;
  }

  Future<bool> otpValidateApi(BuildContext context,
      {required Map<String, dynamic> body,
      required FToast fToast,
      required VoidCallback function}) async {
    // creatingCity.value = true;
    try {
      Map<String, dynamic> data = body;
      final response = await ApiMiddleWear(
        url: ApiConstant.otpValidateUrl,
        data: data,
      ).post(
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.statusCode == 200) {
        showToast(context, fToast, response.data["message"], false);

        function();

        return true;
      } else {
        showToast(context, fToast, response.data["message"], true);
      }
    } catch (e) {
      // printC('error:$e');
    } finally {
      // creatingCity.value = false;
    }
    return false;
  }
}
