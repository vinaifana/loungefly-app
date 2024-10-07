import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'Loungefly',
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenHeight(36),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          ),
        Image.asset(image)
      ],
    );
  }
}
