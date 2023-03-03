import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peepapp/common/api_service.dart';

class LoginController extends ChangeNotifier {
  LoginController() {
    ApiService();
  }

  bool _isOtpSent = false;
  bool loadingOtpSend = false;
  bool loadingLogin = false;
  TextEditingController phoneController = TextEditingController();
  final List<Map<String, dynamic>> otpControllers = [
    {'text': TextEditingController(), 'focus': FocusNode()},
    {'text': TextEditingController(), 'focus': FocusNode()},
    {'text': TextEditingController(), 'focus': FocusNode()},
    {'text': TextEditingController(), 'focus': FocusNode()},
    {'text': TextEditingController(), 'focus': FocusNode()},
    {'text': TextEditingController(), 'focus': FocusNode()},
  ];
  static String userToken = "";

  bool get isOtpSent => _isOtpSent;

  bool isOtpFilled() {
    for (int i = 0; i < otpControllers.length; i++) {
      if (otpControllers[i]['text'].text.toString().trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  String getOtp() {
    String otp = "";
    for (int i = 0; i < otpControllers.length; i++) {
      if (otpControllers[i]['text'].text.toString().trim().isNotEmpty) {
        otp += otpControllers[i]['text'].text.toString().trim();
      }
    }
    return otp;
  }

  Future<dynamic> sendOtp() {
    loadingOtpSend = true;
    notifyListeners();
    final result = ApiService.apiDelegate(
      reqMethod: "POST",
      endPoint: "auth/v1/login/otp",
      payload: {
        "phone": phoneController.text.toString().trim(),
      },
    ).then((value) {
      loadingOtpSend = false;
      _isOtpSent = true;
      notifyListeners();
      return value;
    }).onError<DioError>((error, stackTrace) {
      loadingOtpSend = false;
      _isOtpSent = false;
      notifyListeners();
      return error;
    });
    return result;
  }

  Future<dynamic> login() async {
    loadingLogin = true;
    notifyListeners();
    final result = await ApiService.apiDelegate(
      reqMethod: "POST",
      endPoint: "auth/v1/login",
      payload: {
        "phone": phoneController.text.toString().trim(),
        "otp": getOtp(),
      },
    ).then((value) {
      loadingLogin = false;
      notifyListeners();
      userToken = value.data['token'];
      return value;
    }).onError<DioError>((error, stackTrace) {
      loadingLogin = false;
      notifyListeners();
      return error;
    });
    return result;
  }
}
