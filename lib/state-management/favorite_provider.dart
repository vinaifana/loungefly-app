import 'package:flutter/material.dart';

class FavoriteItem {
  final String id;
  final String title;
  final int price;

  FavoriteItem({required this.id, required this.title, required this.price});
}

class FavoriteProvider with ChangeNotifier{
  final Map<String, FavoriteItem> _favoriteItems = {};

  Map<String, FavoriteItem> get favoriteItems => _favoriteItems;

  int get itemCount => _favoriteItems.length;

  void addItemToFav(String id, String title, int price) {
    if (_favoriteItems.containsKey(id)) {
      return;
      // jika sudah ada item yang ditambahkan ke keranjang
    } else {
      _favoriteItems.putIfAbsent(
        id, 
        () => FavoriteItem(id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItemFromFav(String id) {
    _favoriteItems.remove(id);
    notifyListeners();
  }

  void clearFav() {
    _favoriteItems.clear();
    notifyListeners();
  }
}