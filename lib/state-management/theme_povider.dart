import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  ThemeProvider() {
    // untuk melakukan perubahan tema
    _loadTheme();
  }
// TODO - PR untuk mengingat ini itu sebenarnya apa sih
  bool get isDarkTheme => _isDarkTheme;

  //an asynchronous process
  //used for toggle change activity
  void toggleTheme (bool isDark) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme =isDark;
    await prefs.setBool('isDarkTheme', isDark);
    notifyListeners();
  }

  //an asynchronous process 
  //used for theme changing proce
  void _loadTheme () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? => elvic operator: for defining a default value in our variable (to avoid NPE => Null Pointer Exception)
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }
}