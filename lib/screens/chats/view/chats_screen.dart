import 'package:flutter/material.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/chats/controller/chats_controller.dart';
import 'package:peepapp/screens/chats/view/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ChatsScreen extends StatelessWidget {
  static const routeName = '/ChatsScreen';
  ChatsScreen({super.key});
  final timeTemplate = DateFormat('hh:mm aaa');

  @override
  Widget build(BuildContext context) {
    final chatCtrlWatch = context.watch<ChatsController>();
    final chatCtrlRead = context.read<ChatsController>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.5.wp,
        vertical: 1.0.hp,
      ),
      child: ListView.builder(
        itemCount: chatCtrlWatch.chats.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            chatCtrlRead.setSelectedChat(chatCtrlWatch.chats[i]);
            Navigator.pushNamed(context, ChatScreen.routeName);
          },
          child: Container(
            height: 2.5.hp,
            padding: EdgeInsets.only(bottom: 0.5.hp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 5.0.wp,
                  width: 5.0.wp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/bg.jpg",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.5.wp,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chatCtrlWatch.chats[i].name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 4.25.sp,
                          color: const Color(0xff936AB9),
                        ),
                      ),
                      Text(
                        chatCtrlWatch.chats[i].chats[0].msg.toString(),
                        style: TextStyle(
                          fontSize: 3.75.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  timeTemplate
                      .format(DateTime.fromMillisecondsSinceEpoch(
                          int.parse((int.parse(
                        chatCtrlWatch.chats[i].chats[0].timeStamp.toString(),
                      )).toString())))
                      .toString(),
                  style: TextStyle(
                    fontSize: 3.25.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
