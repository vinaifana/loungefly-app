import 'package:e_commerce/consts.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        const Spacer(),
        Text(
          'Loungefly',
          style: TextStyle(
            color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
            fontSize: getProportionateScreenHeight(36),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: themeProvider.isDarkTheme ? Colors.white : textColor
          ),
          ),
        Image.asset(image)
      ],
    );
  }
}
