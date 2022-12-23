import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/account/controller/account_controller.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = '/accountScreen';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountCtrlWatch = context.watch<AccountController>();
    return Container(
      child: ListView(
        children: [
          SizedBox(height: 1.0.hp),
          SizedBox(
            height: 10.0.wp,
            width: 10.0.wp,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 13.0.wp,
                    width: 13.0.wp,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/bg.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.2, 0.9),
                  child: Container(
                    width: 2.75.wp,
                    height: 2.75.wp,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      border: Border(
                        top: BorderSide(
                          color: Colors.white,
                          width: 0.2.wp,
                        ),
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 0.2.wp,
                        ),
                        left: BorderSide(
                          color: Colors.white,
                          width: 0.2.wp,
                        ),
                        right: BorderSide(
                          color: Colors.white,
                          width: 0.2.wp,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(0.1.wp),
                      child: Icon(
                        Icons.edit,
                        size: 1.5.wp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.5.hp),
          Center(
            child: Text(
              accountCtrlWatch.user.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 6.0.sp,
              ),
            ),
          ),
          Center(
            child: Text(
              accountCtrlWatch.user.whatIDo,
              style: TextStyle(
                fontSize: 3.0.sp,
              ),
            ),
          ),
          SizedBox(height: 1.0.hp),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
            height: 20.0.hp,
            child: Card(
              elevation: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 0.25.hp,
                    ),
                    height: 2.25.hp,
                    child: TextFormField(
                      controller: TextEditingController(
                        text: accountCtrlWatch.user.name,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 0.1.hp,
                        ),
                        hintText: "Enter Name",
                        labelText: "Name",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 0.25.hp,
                    ),
                    height: 2.25.hp,
                    child: TextFormField(
                      controller: TextEditingController(
                        text:
                            "+${accountCtrlWatch.user.code} ${accountCtrlWatch.user.number}",
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 0.1.hp,
                        ),
                        hintText: "Enter Mobile Number",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Mobile No",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 0.25.hp,
                    ),
                    height: 2.25.hp,
                    child: TextFormField(
                      controller: TextEditingController(
                        text: accountCtrlWatch.user.gender,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        contentPadding: EdgeInsets.only(
                          top: 0.1.hp,
                        ),
                        hintText: "Select Gender",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Gender",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 0.25.hp,
                    ),
                    height: 2.25.hp,
                    child: TextFormField(
                      controller: TextEditingController(
                        text: accountCtrlWatch.user.whatIDo,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 0.1.hp,
                        ),
                        hintText: "What I Do",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "What I Do",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 0.25.hp,
                    ),
                    height: 2.25.hp,
                    child: TextFormField(
                      controller: TextEditingController(
                        text: accountCtrlWatch.user.worksAt,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 0.1.hp,
                        ),
                        hintText: "Works At",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Works At",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 0.25.hp,
                    ),
                    height: 2.25.hp,
                    child: TextFormField(
                      controller: TextEditingController(
                        text: accountCtrlWatch.user.status,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        contentPadding: EdgeInsets.only(
                          top: 0.1.hp,
                        ),
                        hintText: "Status",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Status",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 0.25.hp,
                    ),
                    height: 2.65.hp,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Intrests",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 4.0.sp,
                          ),
                        ),
                        SizedBox(height: 0.25.hp),
                        Row(
                          children: accountCtrlWatch.user.intrests
                              .map(
                                (e) => Container(
                                  margin: EdgeInsets.only(right: 1.0.wp),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff936AB9)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(1.0.wp),
                                  ),
                                  padding: EdgeInsets.all(0.5.wp),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        e,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 0.4.wp),
                                      Icon(
                                        Icons.close,
                                        size: 1.5.wp,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 0.5.hp),
          Container(
            height: 1.75.hp,
            margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
            decoration: BoxDecoration(
              color: const Color(0xff936AB9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "UPDATE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 5.5.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 0.5.hp),
        ],
      ),
    );
  }
}
