import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;

  CartItem({required this.id, required this.title, required this.price});
}

// with untuk menambahkan fitur ke sebuah kelas
// to knowing what's differences between OOP and FP (Functional Programming)
// Map adalah key value, disini Map adalah key dan value nya adalah CartItem
class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  void addItem(String id, String title, int price) {
    if (_items.containsKey(id)) {
      return ;
    } else {
      // kalo kondisi lain gak terpenuhi dia punya kondisi lain yaitu dia akan menambahkan icon secara otomatis
      _items.putIfAbsent(
        id, 
        () => CartItem(id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}