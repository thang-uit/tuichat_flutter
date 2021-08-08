import 'package:flutter/material.dart';
import '../../constants.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // automaticallyImplyLeading: false,
      title: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/user_5.png"),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kStatusOnlineColor,
                    ),
                  ),
              ),
            ],
          ),
          // SizedBox(width: kDefaultPadding * 0.25),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nguyễn Thị Hồng Thủy",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "online",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.call_rounded)),
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam_rounded)),
      ],
    );
  }
}
