class ChatsModel {
  String img;
  String name;
  List<ChatModel> chats;

  ChatsModel({required this.img, required this.name, required this.chats});
}

class ChatModel {
  String msg;
  int timeStamp;
  bool isSent;

  ChatModel({required this.msg, required this.timeStamp, required this.isSent});
}
