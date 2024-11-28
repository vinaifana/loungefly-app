import 'package:flutter/material.dart';

class FavoriteItem {
  final String id;
  final String title;
  final int price;
  final String image;

  FavoriteItem(this.image, {required this.id, required this.title, required this.price});
}

class FavoriteProvider with ChangeNotifier{
  final Map<String, FavoriteItem> _favoriteItems = {};

  Map<String, FavoriteItem> get favoriteItems => _favoriteItems;

  int get itemCount => _favoriteItems.length;

  void addItemToFav(String id, String title, int price, String image) {
    if (_favoriteItems.containsKey(id)) {
      return;
      // jika sudah ada item yang ditambahkan ke keranjang
    } else {
      _favoriteItems.putIfAbsent(
        id, 
        () => FavoriteItem(image, id: id, title: title, price: price,)
      );
    }
    notifyListeners();
  }

  void removeItemFromFav(String id) {
    _favoriteItems.remove(id);
    notifyListeners();
  }

  void clearFav() {
    // method clear tidak perlu di triger, karna dia memang sudah di triger di notifyListeners()s
    _favoriteItems.clear();
    notifyListeners();
  }
}