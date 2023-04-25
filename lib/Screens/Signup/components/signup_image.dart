import 'package:flutter/material.dart';
import 'package:tecbook/constants.dart';

class SignUpScreenImage extends StatelessWidget {
  const SignUpScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset("assets/images/signup.png"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
