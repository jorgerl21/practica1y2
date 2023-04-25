import 'package:flutter/material.dart';
import 'package:tecbook/Screens/Login/dividerx.dart';
import 'social_icon.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Dividerx(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocialIcon(
              iconSrc: "assets/icons/facebook.png",
              press: () {},
            ),
            SocialIcon(
              iconSrc: "assets/icons/github.png",
              press: () {},
            ),
            SocialIcon(
              iconSrc: "assets/icons/gmail.png",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
