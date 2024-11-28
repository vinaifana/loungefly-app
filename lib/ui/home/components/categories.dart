import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // Data kategori dengan gambar dan teks
  List<Map<String, String>> categories = [
    {"text": "Disney", "image": "assets/images/disney.png"},
    {"text": "Pixar", "image": "assets/images/pixar.png"},
    {"text": "Sanrio", "image": "assets/images/sanrio.png"},
    {"text": "Halloween", "image": "assets/images/halloween.png"},
    {"text": "NFL", "image": "assets/images/nfl.png"},
    {"text": "Marvel", "image": "assets/images/marvel.png"},
    {"text": "Collectiv", "image": "assets/images/collectiv.png"}
  ];
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
        children: [
           Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding, left: defaultPadding), 
            child: Text(
              "Shop by Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 100, // Adjust height for image and text
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildCategory(index),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding), //karna lagi pake chrome jadi pake manual value dulu harus defaulPadding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          children: [
            // Gambar kategori di atas teks
            Image.asset(
              categories[index]["image"]!,
              height: 60, // Adjust image height
              width: 60,  // Adjust image width
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 5), // Spacing between image and text
            // Teks kategori
            Text(
              categories[index]["text"]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: selectedIndex == index 
                        ? secondaryColor 
                        : (themeProvider.isDarkTheme ? Colors.white : Colors.black),
              ),
            ),
            // Garis di bawah teks
            Container(
              margin: const EdgeInsets.only(top: 3), // Gap between text and line
              height: 2,
              width: 30,
              color: selectedIndex == index 
                      ? secondaryColor 
                      : (themeProvider.isDarkTheme ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
