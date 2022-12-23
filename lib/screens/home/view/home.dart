import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/account/controller/account_controller.dart';
import 'package:peepapp/screens/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrlRead = context.read<HomeController>();
    final homeCtrlWatch = context.watch<HomeController>();
    final accountCtrlWatch = context.watch<AccountController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(homeCtrlWatch.currentScreen['title']),
        actions:
            homeCtrlWatch.currentScreen['title'].toString().toLowerCase() ==
                    "people"
                ? [
                    Container(
                        padding: EdgeInsets.only(
                          right: 1.0.wp,
                        ),
                        child: const Icon(Icons.share)),
                  ]
                : [],
      ),
      body: SafeArea(
        child: homeCtrlWatch.screenToLoad(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 11.0.hp,
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Container(
                    color: const Color(0xffffffff),
                    height: 11.0.hp,
                    child: Image.asset(
                      'assets/bg.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 2.75.hp,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.5.wp, vertical: 0.5.hp),
                      color: const Color(0xff936AB9).withOpacity(0.4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  accountCtrlWatch.user.name,
                                  style: TextStyle(
                                    fontSize: 4.0.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  accountCtrlWatch.user.email,
                                  style: TextStyle(
                                    fontSize: 3.5.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...homeCtrlRead.sideTabs
                .map((element) => GestureDetector(
                      onTap: () {
                        homeCtrlRead.changeScreen(element);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 1.0.wp),
                        height: 2.50.hp,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              element['icon'],
                            ),
                            SizedBox(width: 1.50.wp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  element['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 4.50.sp,
                                  ),
                                ),
                                element['subTitle'] != ''
                                    ? Text(
                                        element['subTitle'],
                                        style: TextStyle(
                                          fontSize: 2.75.sp,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
