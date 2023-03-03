import 'package:peepapp/screens/home/controller/home_controller.dart';

class ChatsModel {
  String img;
  String name;
  List<ChatModel> chats;
  String id;

  ChatsModel({
    required this.img,
    required this.name,
    required this.chats,
    required this.id,
  });

  static ChatsModel fromMap(Map<String, dynamic> data) => ChatsModel(
        img: data['img'] ?? '',
        name: data['name'] ?? '',
        id: data['id'] ?? '',
        chats: data['chats'] ?? [],
      );
}

class ChatModel {
  int timeStamp;
  bool isSent;
  String id;
  String text;
  String conversationId;
  String createdAt;
  String fromName;
  String fromId;
  String fromUserId;

  ChatModel({
    required this.timeStamp,
    required this.isSent,
    required this.text,
    required this.conversationId,
    required this.createdAt,
    required this.fromName,
    required this.fromId,
    required this.fromUserId,
    required this.id,
  });

  static ChatModel fromMap(Map<String, dynamic> data) => ChatModel(
        conversationId: data['conversationId'] ?? '',
        createdAt: data['createdAt'] ?? '',
        text: data['text'] ?? '',
        id: data['id'] ?? '',
        fromId: data['from']['id'] ?? '',
        fromUserId: data['from']['userId'] ?? '',
        fromName: data['from']['name'] ?? '',
        isSent: data['from']['userId'] == HomeController.userData!.userId,
        timeStamp: data['createdAt'] != null
            ? DateTime.parse(data['createdAt']).millisecondsSinceEpoch
            : DateTime.now().millisecondsSinceEpoch,
      );
}
