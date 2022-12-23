import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/chats/controller/chats_controller.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/ChatScreen';
  ChatScreen({super.key});
  final timeTemplate = DateFormat('hh:mm aaa');

  @override
  Widget build(BuildContext context) {
    final chatCtrlWatch = context.watch<ChatsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(chatCtrlWatch.selectedChat.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatCtrlWatch.selectedChat.chats.length,
              itemBuilder: (context, i) => Align(
                alignment: chatCtrlWatch.selectedChat.chats[i].isSent
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: chatCtrlWatch.selectedChat.chats[i].isSent
                        ? const Color(0xff936AB9)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: chatCtrlWatch.selectedChat.chats[i].isSent
                      ? EdgeInsets.only(
                          left: 10.0.wp,
                          right: 0.75.wp,
                          bottom: 1.0.hp,
                        )
                      : EdgeInsets.only(
                          left: 0.75.wp,
                          right: 10.0.wp,
                          bottom: 1.0.hp,
                        ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.0.wp,
                    vertical: 0.25.hp,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        chatCtrlWatch.selectedChat.chats[i].isSent
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        chatCtrlWatch.selectedChat.chats[i].msg,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 3.75.sp,
                          color: chatCtrlWatch.selectedChat.chats[i].isSent
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 0.3.hp),
                      Text(
                        timeTemplate
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                int.parse((int.parse(
                              chatCtrlWatch.selectedChat.chats[i].timeStamp
                                  .toString(),
                            )).toString())))
                            .toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 3.25.sp,
                          color: chatCtrlWatch.selectedChat.chats[i].isSent
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 2.0.hp,
            padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
            margin: EdgeInsets.symmetric(vertical: 0.75.hp),
            child: TextFormField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.emoji_emotions,
                  color: Colors.grey,
                  size: 8.0.sp,
                ),
                suffixIcon: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff936AB9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                contentPadding: EdgeInsets.only(top: 0.1.hp, left: 1.0.wp),
                hintText: "Type a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.wp),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.wp),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.wp),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
