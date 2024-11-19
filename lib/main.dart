import 'package:e_commerce/consts.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    //placeholder untuk template provider yang belum terdefinisi
    create: (_) => ThemeProvider(),
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
            // '/favorite': (context) => const FavoriteScreen(),
            // '/settings': (context) => SettingsScreen(
            //   isDarkTheme: _isDarkTheme,
            //   onThemeChanged: _toggleTheme,
            // ),
            // '/profile': (context) => const ProfileScreen(),
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