import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peepapp/common/api_service.dart';
import 'package:peepapp/screens/chats/model/chats_model.dart';
import 'package:peepapp/screens/home/controller/home_controller.dart';

class ChatsController extends ChangeNotifier {
  final List<ChatsModel> _chats = [];
  late ChatsModel _selectedChat;
  TextEditingController messageTextCtrl = TextEditingController();

  List<ChatsModel> get chats => _chats;
  ChatsModel get selectedChat => _selectedChat;

  void setSelectedChat(ChatsModel chat, BuildContext context) {
    _selectedChat = chat;
    getSelectedChats(context);
    notifyListeners();
  }

  bool loadingConversation = true;
  getSelectedChats(BuildContext context) async {
    String query = r"""{
      messages(conversationId: _selectedChat.id) {
        content {
          id
          conversationId
          text
          createdAt
          from {
              id
              name
              userId
          }
        }
        number
        size
        totalElements
        totalPages
      }
    }""";
    // query = query.replaceAll("_userDetails.id", HomeController.userData!.id);
    query = query.replaceAll("_selectedChat.id", '"${_selectedChat.id}"');
    loadingConversation = true;
    notifyListeners();
    final result = await ApiService.apiDelegate(
      reqMethod: "POST",
      endPoint: "graphql",
      isGraphSql: true,
      payload: query,
    ).then((value) {
      // log(value.data.toString());
      if (value.data['errors'] != null) {
        if (value.data['errors']?.length > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xff5F25B9),
              content: Text(
                "Error occured while fetching messages.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      } else {
        _selectedChat.chats = [];
        value.data['data']['messages']['content'].forEach((conversation) {
          _selectedChat.chats.add(ChatModel.fromMap(conversation));
        });
      }
      // log(_chats.length.toString());
      loadingConversation = false;
      notifyListeners();
      return value;
    }).onError<DioError>((error, stackTrace) {
      loadingConversation = false;
      notifyListeners();
      return error;
    });
    return result;
  }

  bool loadingChats = true;
  getConversations(BuildContext context) async {
    String query = r"""{
      conversations(userId: _userDetails.id) {
        content {
          id
          name
        }
        number
        size
        totalElements
        totalPages
      }
    }""";
    // query = query.replaceAll("_userDetails.id", HomeController.userData!.id);
    query =
        query.replaceAll("_userDetails.id", '"${HomeController.userData!.id}"');
    final result = await ApiService.apiDelegate(
      reqMethod: "POST",
      endPoint: "graphql",
      isGraphSql: true,
      payload: query,
    ).then((value) {
      // log(value.data.toString());
      if (value.data['errors'] != null) {
        if (value.data['errors']?.length > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xff5F25B9),
              content: Text(
                "Error occured while fetching messages.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      } else {
        _chats.clear();
        value.data['data']['conversations']['content'].forEach((conversation) {
          _chats.add(ChatsModel.fromMap(conversation));
        });
      }
      // log(_chats.length.toString());
      loadingChats = false;
      notifyListeners();
      return value;
    }).onError<DioError>((error, stackTrace) {
      loadingChats = false;
      notifyListeners();
      return error;
    });
    return result;
  }

  sendChats(BuildContext context) async {
    String query = r"""mutation Message {
      sendMessage (input: {
        conversationId: _selectedChat.id,
        from: _userData.id,
        text: _messageContent
      }) {
        id
        conversationId
        from {
            id
            name
            userId
        }
        text
      }
    }""";
    // query = query.replaceAll("_userDetails.id", HomeController.userData!.id);
    query = query.replaceAll("_selectedChat.id", '"${_selectedChat.id}"');
    query =
        query.replaceAll("_userData.id", '"${HomeController.userData!.id}"');
    query =
        query.replaceAll("_messageContent", '"${messageTextCtrl.text.trim()}"');
    messageTextCtrl.clear();
    final result = await ApiService.apiDelegate(
      reqMethod: "POST",
      endPoint: "graphql",
      isGraphSql: true,
      payload: query,
    ).then((value) {
      // log(value.data.toString());
      if (value.data['errors'] != null) {
        if (value.data['errors']?.length > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xff5F25B9),
              content: Text(
                "Error occured while fetching messages.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      } else {
        _selectedChat.chats.insert(
          0,
          ChatModel.fromMap(value.data['data']['sendMessage']),
        );
        notifyListeners();
      }
      return value;
    }).onError<DioError>((error, stackTrace) {
      return error;
    });
    return result;
  }
}
