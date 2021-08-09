import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Row(
            children: [
              Icon(Icons.photo_rounded, color: kPrimaryColor),
              Icon(Icons.camera_alt_rounded, color: kPrimaryColor),
              Icon(Icons.mic_rounded, color: kPrimaryColor),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
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
            ],
          ),
        ),
      ],
    );
  }
}
