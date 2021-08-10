import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuichat_flutter/models/ChatMessage.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) => Message(chatMessage: chatMessages[index]),
              ),
            ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding / 2),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 25),
                  blurRadius: 30,
                ),
              ],
          ),
          child: Row(
            children: [
              Icon(Icons.photo_rounded, color: kPrimaryColor),
              // Icon(Icons.camera_alt_rounded, color: kPrimaryColor),
              // Icon(Icons.mic_rounded, color: kPrimaryColor),
              SizedBox(width: kDefaultPadding * 0.5),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 100
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Type message",
                              border: InputBorder.none,
                            ),
                          ),
                      ),
                      SizedBox(width: kDefaultPadding / 4),
                      Icon(Icons.sentiment_satisfied_alt_rounded,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.6)
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: kDefaultPadding * 0.5),
              Icon(Icons.send_rounded, color: kPrimaryColor),
            ],
          ),
        ),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: this.chatMessage.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        TextMessage(chatMessage: this.chatMessage),
      ],
    );
  }
}

class TextMessage extends StatelessWidget{
  const TextMessage({
    Key? key,
    required this.chatMessage,
  }): super(key: key);

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding * 0.5),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.5),
      decoration: BoxDecoration(
        color: this.chatMessage.isSender ? kPrimaryColor : kNotSenderColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(this.chatMessage.text.toString().trim()),
    );
  }
}
