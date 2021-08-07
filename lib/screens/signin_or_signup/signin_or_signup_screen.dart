import 'package:flutter/material.dart';
import 'package:tuichat_flutter/chats/chat_screen.dart';
import 'package:tuichat_flutter/components/primary_button.dart';
import '../../constants.dart';

class SigninOrSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Spacer(flex: 2),
          Image.asset(
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? "assets/images/logo_light.png"
                  : "assets/images/logo_dark.png",
              height: 140),
          Spacer(),
          PrimaryButton(
              text: "Sign In",
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()))),
          SizedBox(height: kDefaultPadding * 1.5),
          PrimaryButton(
              color: Theme.of(context).colorScheme.secondary,
              text: "Sign Up",
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()))),
          Spacer(flex: 2),
        ],
      ),
    )));
  }
}
