import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/login/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 5.50.hp,
                ),
                SizedBox(height: 1.50.hp),
                Text(
                  "PeepApp",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff5F25B9).withOpacity(0.4),
                    fontSize: 7.5.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
