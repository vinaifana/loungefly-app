import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  CartItem({required this.image, required this.id, required this.title, required this.price, this.quantity = 1});
}

// with untuk menambahkan fitur ke sebuah kelas
// to knowing what's differences between OOP and FP (Functional Programming)
// Map adalah key value, disini Map adalah key dan value nya adalah CartItem
class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  // fungsinya untuk handle perhitungan total harga
  int get totalPrice {
    // ini adalah sintak ketika kita akan mengoperasikan aritmatika atau matematika
    return _items.values.fold(
      // initial status sebelum operasi matematika dilakukan
      0,
      // sum itu adalah sebuah deklarasi variable bahwa dia sintak 0 aritmatika nama variable nya bisa apa aja
      (sum, item) => sum + item.price * item.quantity
    );
  }

  void updateQuantity (String productId, int quantity) {
    notifyListeners();
  }

  void addItem(String id, String title, int price, String image, int quantity) {
    if (_items.containsKey(id)) {
      // jika satu produk di masukan ke keranjang 1, dan user memasukan lagi 1 maka dia akan bertambah (gk hanya satu) dia akan bertambah sesuai dgn cart counter
      _items[id]!.quantity += quantity;
    } else {
      // kalo belum ada di keranjang maka akan lakukan ini
    _items[id] = CartItem(image: image, id: id, title: title, price: price, quantity: 1,);     
    }
    notifyListeners();
  }

  void removeItems(String id) {
    // dia remove nya akan satu persatu dalam satu produk jadi jika ada 1 produk yang ada dikerangjang 3 maka dihapus nya akan satu persatu
    if (_items.containsKey(id)) {
      _items[id]!.quantity--;
      
      if (_items[id]!.quantity <= 0) {
        _items.remove(id);
      }
    }
    notifyListeners();
  }
}