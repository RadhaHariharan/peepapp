import 'package:flutter/material.dart';
import 'package:peepapp/screens/account/model/user_model.dart';

class AccountController extends ChangeNotifier {
  final UserModel _user = UserModel(
    name: "Muzeer",
    whatIDo: "Staff Engineer",
    number: 9876543210,
    code: 91,
    gender: "Male",
    worksAt: "VComply",
    status: "Married",
    intrests: ["Backend", "Mobile Developing"],
    img: "",
    email: "muzeer@gmail.com",
  );

  UserModel get user => _user;
}
