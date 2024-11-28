// Model => detail data
// item = untuk mengdefinisikan bagaimana sebuah objek akan terihat
// untuk menjadikan sebuah object reuseable


import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: themeProvider.isDarkTheme ? Colors.white : product.color,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Hero(
                tag: "${product.id}", 
                child: Image.asset(product.image),
              ),
            ),
          ),
          Text(
            product.title,
            style: TextStyle(
              color: themeProvider.isDarkTheme ? Colors.white : textColor,
            ),
          ),
          Text(
            "Rp ${product.price}",
            style: TextStyle(
              color: themeProvider.isDarkTheme ? Colors.white : textColor,
            ),
          )
        ],
      ),
    );
  }
}