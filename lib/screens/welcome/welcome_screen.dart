import 'package:flutter/material.dart';
import 'package:tuichat_flutter/constants.dart';
import 'package:tuichat_flutter/screens/signin_or_signup/signin_or_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            Image.asset("assets/images/welcome_image.png"),
            Spacer(flex: 2),
            Text(
              "Welcome to our Freedom \nmessaging app",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "Freedom talk any person of your \nmother language.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.6)),
            ),
            Spacer(flex: 3),
            FittedBox(
                child: TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SigninOrSignupScreen())),
                    child: Row(
                      children: [
                        Text(
                          "Skip",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!
                                      .withOpacity(0.8)),
                        ),
                        SizedBox(width: kDefaultPadding / 10),
                        Icon(Icons.arrow_forward_ios,
                            size: 14,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.8))
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
