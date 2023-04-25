import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String? iconSrc;
  final Function? press;
  const SocialIcon({
    Key? key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconSrc!,
          height: 45,
          width: 45,
        ),
      ),
    );
  }
}
