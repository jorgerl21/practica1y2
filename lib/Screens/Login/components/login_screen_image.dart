import 'package:flutter/material.dart';
import 'package:tecbook/constants.dart';

class LoginScreenImage extends StatelessWidget {
  const LoginScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Image.asset('assets/images/login.png'),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
