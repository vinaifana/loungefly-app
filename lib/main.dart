import 'package:e_commerce/consts.dart';
import 'package:e_commerce/profile/profile_screen.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/favorite_provider.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/wishlist/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ],
    child: const Loungefly()
  )
  );
}

class Loungefly extends StatefulWidget {
  const Loungefly({super.key});

  @override
  State<Loungefly> createState() => _LoungeflyState();
}

class _LoungeflyState extends State<Loungefly> {
  // compile adalah proses penerjemahan dari bahasa coding ke bahasa mesin
  // Runtime alat untuk penerjemahan
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) { 
        return MaterialApp(
          debugShowCheckedModeBanner: false, //di set false biar gak muncul
          title: 'Loungefly',
          theme: ThemeData(
            brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
            fontFamily: 'Muli',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: textColor),
              bodySmall: TextStyle(color: textColor)
            )
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterScreen(),
            '/catalogue': (context) => const CatalogueScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/cart': (context) => const CartScreen(),
            '/favorite': (context) => const FavoriteScreen(),
            '/profile': (context) => const ProfileScreen(),
            // '/settings': (context) => SettingsScreen(
            //   isDarkTheme: _isDarkTheme,
            //   onThemeChanged: _toggleTheme,
            // ),
          }
        );
       }, 
    );
  }
}

// Material app adalah kerangka
// Scafold adalah kanvas
//SettingsScreen(
//        isDarkTheme: _isDarkTheme,
//        onThemeChanged: _toggleTheme
//      ),
// change notifier adalah kelas wajib yang harus diambil karakternya dengan menggunakan provicer untuk mewariskanya
// state management adalah class yang berfungi untuk membantu mengelola UI, membantu mengelola data yang dinamis, membantu mengurangi adanya boiler plate (kode yang ditulis secara berulang)
// agar kode yang ditulis menjadi efisien dan mudah di kelola.
