import 'package:flutter/material.dart';
import 'package:peepapp/screens/chats/model/chats_model.dart';

class ChatsController extends ChangeNotifier {
  final List<ChatsModel> _chats = [
    ChatsModel(
      img: "",
      name: "Muzeer",
      chats: [
        ChatModel(
          msg:
              "Welcome to PeepApp, Have a wondeful place to chat to with friends",
          timeStamp: 1670511718000,
          isSent: true,
        ),
      ],
    ),
    ChatsModel(
      img: "",
      name: "Radha Hariharan",
      chats: [
        ChatModel(
          msg: "Welcome to App",
          timeStamp: 1670511718000,
          isSent: true,
        ),
        ChatModel(
          msg: "Welcome to PeepApp, Have a wondeful place to chat with friends",
          timeStamp: 1670511718000,
          isSent: false,
        ),
        ChatModel(
          msg: "Welcome to PeepApp",
          timeStamp: 1670511718000,
          isSent: false,
        ),
      ],
    ),
  ];
  late ChatsModel _selectedChat;

  List<ChatsModel> get chats => _chats;
  ChatsModel get selectedChat => _selectedChat;

  void setSelectedChat(ChatsModel chat) {
    _selectedChat = chat;
    notifyListeners();
  }
}
