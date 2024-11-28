import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  // ini adalah bentuk dari inisialisasi variable
  final Product product;

  // ini adalah bentuk dari deklarasi variable
  // int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // menggunakan generik agar data tetap bisa di akses
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    // untuk memeriksa apakah produk sudah di favoritkan atau belum
    final isFavorite = favoriteProvider.favoriteItems.containsKey(
      product.id.toString()
    );
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          // untuk menghapus item dari wishlist
          // jadi kalo kondisi terpenuhi alias ada di wishlist maka dia bisa di hapus
          favoriteProvider.removeItemFromFav(product.id.toString());
        } else {
          // tapi kalo gak ada dia akan memasukan item ke wishlist
          favoriteProvider.addItemToFav(
            product.id.toString(),
            product.title,
            product.price,
            product.image,
          );
        }
      }, 
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        // jika dia sudah ada di favorite maka akan berwarna merah jika belum maka akan berwarna abu-abu
        color: isFavorite ? Colors.red : Colors.grey.shade900,
      ),
      color: Colors.black,
    );
  }
}