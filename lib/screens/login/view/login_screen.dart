import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/login/widgets/otp_widget.dart';
import 'package:peepapp/screens/login/widgets/phone_widget.dart';
import 'package:peepapp/screens/splash/controller/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCtrlWatch = context.watch<LoginController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF0BFFD),
                Color(0xff5F25B9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.65),
                child: Image.asset(
                  'assets/logo.png',
                  height: 5.50.hp,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 20.0.hp,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: loginCtrlWatch.isOtpSent
                        ? EdgeInsets.symmetric(horizontal: 2.75.wp)
                        : EdgeInsets.symmetric(horizontal: 2.75.wp),
                    margin: EdgeInsets.only(bottom: 5.0.hp),
                    child: loginCtrlWatch.isOtpSent
                        ? const OTPWidget()
                        : const PhoneWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
