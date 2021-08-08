import 'package:flutter/material.dart';
import 'package:tuichat_flutter/models/Chat.dart';
import '../../../constants.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.5),
        child: Row(
            children: [
              Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(chat.image),
                    ),
                    if(chat.isActive)
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kStatusOnlineColor),
                        ),
                      ),
                  ],
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat.name,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Opacity(
                              opacity: 0.6,
                              child: Text(
                                chat.lastMessage,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                          ),
                        ],
                      )
                  )
              ),
              Opacity(
                opacity: 0.6,
                child: Text(chat.time),
              )
            ]
        ),
      ),
    );
  }
}