import 'package:flutter/material.dart';
import 'package:peepapp/screens/shouts/model/shout_model.dart';

class ShoutController extends ChangeNotifier {
  final List<ShoutModel> _chat = [
    ShoutModel(
      name: "Radha Hariharan",
      isSent: true,
      msg: "Thanks for welcoming",
      timeStamp: 1670593671000,
      img: "",
    ),
    ShoutModel(
      name: "Muzeer",
      isSent: false,
      msg: "Welcome to shouts",
      timeStamp: 1670593671000,
      img: "",
    ),
  ];

  List<ShoutModel> get chat => _chat;
}
