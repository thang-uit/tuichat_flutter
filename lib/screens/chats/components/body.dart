import 'package:flutter/material.dart';
import 'package:tuichat_flutter/components/filled_outline_button.dart';
import 'package:tuichat_flutter/models/Chat.dart';
import 'package:tuichat_flutter/screens/messages/message_screen.dart';
import '../../../constants.dart';
import 'chat_card.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              SizedBox(width: kDefaultPadding),
              FillOutlineButton(press: () {}, text: "Active", isFilled: false),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (context, index) => ChatCard(
            chat: chatData[index],
            press: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MessageScreen())),
          ),
        )),
      ],
    );
  }
}
