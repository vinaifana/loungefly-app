import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    return IconButton(
      onPressed: () {
        favoriteProvider.addItemToFav(
          product.id.toString(),
          product.title,
          product.price
        );
      }, 
      icon: const Icon(Icons.favorite_border),
      color: Colors.black,
    );
  }
}