import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/splash/controller/login_controller.dart';
import 'package:provider/provider.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCtrlWatch = context.watch<LoginController>();
    return Column(
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
          padding: EdgeInsets.symmetric(horizontal: 1.25.wp),
          child: TextFormField(
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,
            controller: loginCtrlWatch.phoneController,
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
                borderRadius: BorderRadius.circular(1.0.wp),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0.wp),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0.wp),
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
          onTap: () async {
            if (!loginCtrlWatch.loadingOtpSend) {
              if (loginCtrlWatch.phoneController.text.length == 10) {
                final result = await loginCtrlWatch.sendOtp();
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
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color(0xff5F25B9),
                    content: Text(
                      "Please enter valid 10 digit number",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }
            }
          },
          child: Container(
            height: 2.0.hp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.0.wp),
              color: const Color(0xff5F25B9),
            ),
            child: loginCtrlWatch.loadingOtpSend
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
                      "CONTINUE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
