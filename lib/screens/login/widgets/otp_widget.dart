import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/home/controller/home_controller.dart';
import 'package:peepapp/screens/home/view/home.dart';
import 'package:peepapp/screens/splash/controller/login_controller.dart';
import 'package:provider/provider.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCtrlWatch = context.watch<LoginController>();
    final homeCtrlRead = context.read<HomeController>();
    return Column(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < loginCtrlWatch.otpControllers.length; i++)
              Container(
                height: 2.0.hp,
                width: 2.0.hp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.0.wp),
                  border: Border.all(
                    color: const Color(0xff5F25B9),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    controller: loginCtrlWatch.otpControllers[i]['text'],
                    focusNode: loginCtrlWatch.otpControllers[i]['focus'],
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 6.0.sp,
                    ),
                    onChanged: (val) {
                      if (val.length == 1) {
                        if (i == 5) {
                          FocusScope.of(context).unfocus();
                        } else {
                          int nextIndex = i + 1;
                          FocusScope.of(context).requestFocus(
                            loginCtrlWatch.otpControllers[nextIndex]['focus'],
                          );
                        }
                      }
                      //  else {
                      //   if (i == 0) {
                      //     FocusScope.of(context).unfocus();
                      //   } else {
                      //     int previousIndex = i - 1;
                      //     FocusScope.of(context).requestFocus(
                      //       loginCtrlWatch.otpControllers[previousIndex]
                      //           ['focus'],
                      //     );
                      //   }
                      // }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0.wp),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0.wp),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0.wp),
                        borderSide: BorderSide.none,
                      ),
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
          onTap: loginCtrlWatch.loadingLogin
              ? () {}
              : () async {
                  if (loginCtrlWatch.isOtpFilled()) {
                    final result = await loginCtrlWatch.login();
                    if (result.runtimeType.toString() == "DioError") {
                      if (result.response.statusCode == 400) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: const Color(0xff5F25B9),
                            content: Text(
                              result.response.data['message'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    } else if (result.statusCode == 200) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(
                        context,
                        HomeScreen.routeName,
                      );
                      homeCtrlRead.getUserDetails();
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color(0xff5F25B9),
                        content: Text(
                          "Please enter OTP",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                },
          child: Container(
            height: 2.0.hp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.0.wp),
              color: const Color(0xff5F25B9),
            ),
            child: loginCtrlWatch.loadingLogin
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.2.hp),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : const Center(
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
    );
  }
}
