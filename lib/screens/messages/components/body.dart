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
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) => Message(chatMessage: chatMessages[index]),
            ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding / 2),
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
  final ChatMessage chatMessage;

  const Message({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Widget messageContent(ChatMessage chatMessage) {
      switch (chatMessage.messageType) {
        case ChatMessageType.text:
          {
            return TextMessage(chatMessage: chatMessage);
            break;
          }
        case ChatMessageType.image:
          {
            return TextMessage(chatMessage: chatMessage);
            break;
          }
        case ChatMessageType.video:
          {
            return VideoMessage();
            break;
          }
        case ChatMessageType.audio:
          {
            return AudioMessage(chatMessage: chatMessage);
            break;
          }

        default:
          {
            return SizedBox();
          }
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.25, vertical: kDefaultPadding * 0.5),
      child: Row(
        mainAxisAlignment: this.chatMessage.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if(!this.chatMessage.isSender) ... [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/user_5.png"),
            ),
            SizedBox(width: kDefaultPadding / 4),
          ],
          messageContent(this.chatMessage),
          if (this.chatMessage.isSender) MessageStatusDot(messageStatus: this.chatMessage.messageStatus)
        ],
      ),
    );
  }
}

class TextMessage extends StatelessWidget{
  final ChatMessage chatMessage;

  const TextMessage({
    Key? key,
    required this.chatMessage,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.5),
      decoration: BoxDecoration(
        color: this.chatMessage.isSender ? kPrimaryColor : kNotSenderColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        this.chatMessage.text.toString().trim(),
        style: TextStyle(color: kContentColorLightTheme),
      ),
    );
  }
}

class AudioMessage extends StatelessWidget{
  final ChatMessage chatMessage;

  const AudioMessage({
    Key? key,
    required this.chatMessage,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: this.chatMessage.isSender ? kPrimaryColor : kNotSenderColor,
      ),
      child: Row(
        children: [
          Icon(Icons.play_arrow_rounded, color: Colors.black),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.black,
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
          Text("0:20", style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }

}

class VideoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45, // 45% of total width
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset("assets/images/video_place_here.png"),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: Icon(Icons.play_arrow_rounded, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus messageStatus;

  const MessageStatusDot({
    Key? key,
    required this.messageStatus,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {

    Color dotColor(MessageStatus messageStatus){
      switch (messageStatus){
        case MessageStatus.not_sent: {
          return kErrorColor;
          break;
        }
        case MessageStatus.not_view: {
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.2);
          break;
        }
        case MessageStatus.viewed: {
          return kPrimaryColor;
          break;
        }

        default:{
          return Colors.transparent;
        }
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 5),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor(this.messageStatus),
      ),
      child: Icon(
        this.messageStatus == MessageStatus.not_sent ? Icons.close :  Icons.done_rounded,
          color: Colors.black,
          size: 8),
    );
  }
}
