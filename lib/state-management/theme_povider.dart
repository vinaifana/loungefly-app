import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ketika menggunakan set management provider kita wajib memanggil ChangeNotifier
// BLOC, Get X, Provider, Riverpod
// mengimplementasikan konsep OOP --> inheritence (pewarisan)
class ThemeProvider extends ChangeNotifier {
  // setter (ada _)
  // ThemeProvider itu mewariskan semua sifat dari ChageNotifier
  //setter itu dia privat dia digunakan di file dimana dia di build
  // the important one, untuk menetapkan dan mengatur
  bool _isDarkTheme = false;

  // Untuk mewariskan sifat ThemeProvider ke satu function yaitu _loadTheme()
  ThemeProvider() {
    // untuk melakukan perubahan tema
    _loadTheme();
  }
// getter (setter gak ada _)
// getter itu public , bisa diakses di file lain. tapi tidak bisa dipakai di file yang mana dia build
  bool get isDarkTheme => _isDarkTheme;

  //an asynchronous process
  //used for toggle change activity
  void toggleTheme (bool isDark) async{
    // untuk handle konfigurasi perubahan tema secara local, kegunaan SharedPrefrences dikode ini
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    await prefs.setBool('isDarkTheme', isDark);
    // notfify berguna untuk merecord semua yang di handle oleh set management provider
    notifyListeners();
  }

  //an asynchronous process 
  //used for theme changing process
  void _loadTheme () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? => elvic operator: for defining a default value in our variable (to avoid NPE => Null Pointer Exception)
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }
}

// mixin class adalah fp functional programming
// Step by Step untuk menggunakan state management
// 1. Inisialisasi state management di pubspec yaml
// 2. Buat folder dan class baru untuk state management 
// 3. tambahkan ChangeNotifier di file terkait
// SharedPrefrence untuk menyimpan data secara local, dengan menggunakan key value