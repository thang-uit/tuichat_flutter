import 'package:flutter/material.dart';
import 'package:tuichat_flutter/screens/chats/components/body.dart';
import '../../constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ChatBody(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {},
          child: Icon(Icons.person_add_alt_1_rounded)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded), label: "People"),
            BottomNavigationBarItem(icon: CircleAvatar(radius: 14, backgroundImage: AssetImage("assets/images/user_2.png")), label: "Profile"),
          ],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Chat"),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }
}
