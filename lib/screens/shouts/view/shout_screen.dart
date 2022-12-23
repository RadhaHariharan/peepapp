import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peepapp/common/extensions.dart';
import 'package:peepapp/screens/shouts/controller/shout_controller.dart';
import 'package:provider/provider.dart';

class ShoutScreen extends StatelessWidget {
  static String routeName = '/shoutScreen';
  ShoutScreen({super.key});
  final timeTemplate = DateFormat('hh:mm aaa');

  @override
  Widget build(BuildContext context) {
    final shoutCtrlWatch = context.watch<ShoutController>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: shoutCtrlWatch.chat.length,
            shrinkWrap: true,
            itemBuilder: (context, i) => Row(
              mainAxisAlignment: shoutCtrlWatch.chat[i].isSent
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!shoutCtrlWatch.chat[i].isSent)
                  Container(
                    margin: EdgeInsets.only(
                      left: 0.5.wp,
                    ),
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
                Container(
                  decoration: BoxDecoration(
                    color: shoutCtrlWatch.chat[i].isSent
                        ? const Color(0xff936AB9)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: shoutCtrlWatch.chat[i].isSent
                      ? EdgeInsets.only(
                          left: 10.0.wp,
                          right: 0.5.wp,
                          bottom: 1.0.hp,
                        )
                      : EdgeInsets.only(
                          left: 0.5.wp,
                          right: 10.0.wp,
                          bottom: 1.0.hp,
                          top: 0.5.hp,
                        ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.0.wp,
                    vertical: 0.25.hp,
                  ),
                  child: Column(
                    crossAxisAlignment: shoutCtrlWatch.chat[i].isSent
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      if (!shoutCtrlWatch.chat[i].isSent)
                        Container(
                          margin: EdgeInsets.only(bottom: 0.15.hp),
                          child: Text(
                            shoutCtrlWatch.chat[i].name,
                            style: TextStyle(
                              fontSize: 4.0.sp,
                              color: shoutCtrlWatch.chat[i].isSent
                                  ? Colors.white
                                  : const Color(0xff936AB9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Text(
                        shoutCtrlWatch.chat[i].msg,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 3.75.sp,
                          color: shoutCtrlWatch.chat[i].isSent
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 0.3.hp),
                      Container(
                        child: Text(
                          timeTemplate
                              .format(DateTime.fromMillisecondsSinceEpoch(
                                  int.parse((int.parse(
                                shoutCtrlWatch.chat[i].timeStamp.toString(),
                              )).toString())))
                              .toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 3.25.sp,
                            color: shoutCtrlWatch.chat[i].isSent
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
              prefixIcon: const Icon(
                Icons.emoji_emotions,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.send,
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.only(top: 0.1.hp, left: 1.0.wp),
              hintText: "Type a message",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.wp),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.wp),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.wp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
