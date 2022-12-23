import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/home/view/home.dart';
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
                        ? EdgeInsets.symmetric(horizontal: 4.0.wp)
                        : EdgeInsets.symmetric(horizontal: 2.75.wp),
                    margin: EdgeInsets.only(bottom: 5.0.hp),
                    child: loginCtrlWatch.isOtpSent
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "OTP",
                                style: TextStyle(
                                  fontSize: 6.0.sp,
                                  color: const Color(0xff5F25B9),
                                ),
                              ),
                              SizedBox(
                                height: 1.50.hp,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 2.5.hp,
                                    width: 2.5.hp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1.0.wp),
                                      border: Border.all(
                                        color: const Color(0xff5F25B9),
                                      ),
                                    ),
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 6.0.sp,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 2.5.hp,
                                    width: 2.5.hp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1.0.wp),
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 6.0.sp,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 2.5.hp,
                                    width: 2.5.hp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1.0.wp),
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 6.0.sp,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 2.5.hp,
                                    width: 2.5.hp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1.0.wp),
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 6.0.sp,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.0.wp),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.25.hp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "45 sec",
                                    style: TextStyle(
                                      fontSize: 3.0.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.75.hp,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushReplacementNamed(
                                  context,
                                  HomeScreen.routeName,
                                ),
                                child: Container(
                                  height: 2.0.hp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.0.wp),
                                    color: const Color(0xff5F25B9),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "SUBMIT",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.75.hp,
                              ),
                              Text(
                                "Didn't get the code?",
                                style: TextStyle(
                                  fontSize: 3.25.sp,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  color: const Color(0xff5F25B9),
                                ),
                              ),
                              SizedBox(height: 0.25.hp),
                              SizedBox(
                                width: 17.75.wp,
                                child: Center(
                                  child: Text(
                                    "Please enter a valid number, where you will receive the OTP",
                                    style: TextStyle(
                                      fontSize: 3.0.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.0.hp),
                              Container(
                                height: 2.0.hp,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 1.25.wp),
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.only(
                                      top: 0.1.hp,
                                      left: 0.70.wp,
                                    ),
                                    prefixIcon: Container(
                                      width: 4.75.wp,
                                      margin: EdgeInsets.only(left: 0.70.wp),
                                      child: Row(
                                        children: [
                                          const Text("+91"),
                                          Container(
                                            width: 0.10.wp,
                                            height: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 0.35.wp,
                                              vertical: 0.35.hp,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                color: Color(0xff5F25B9),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(1.0.wp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(1.0.wp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(1.0.wp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.0.hp),
                              GestureDetector(
                                onTap: () => loginCtrlWatch.optSent(),
                                child: Container(
                                  height: 2.0.hp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.0.wp),
                                    color: const Color(0xff5F25B9),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "CONTINUE",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
