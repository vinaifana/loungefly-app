import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // untuk inisialisasi ViewPager
  List<Map<String, String>> categories = [
    {
      "text": "Disney",
      "image": "assets/images/disney.png"
    },
    {
      "text": "Pixar",
      "image": "assets/images/pixar.png"
    },
    {
      "text": "Sanrio",
      "image": "assets/images/sanrio.png"
    },
    {
      "text": "Halloween",
      "image": "assets/images/halloween.png"
    },
    {
      "text": "NFL",
      "image": "assets/images/nfl.png"
    },
    {
      "text": "Marvel",
      "image": "assets/images/marvel.png"
    },
    {
      "text": "Collectiv",
      "image": "assets/images/collectiv.png"
    }
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align text to the start (left)
        children: [
          const Padding(
            padding:
                EdgeInsets.only(bottom: defaultPadding, left: defaultPadding), // Space between the text and list
            child: Text(
              "Shop by Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, // Adjust the font size as needed
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 25,
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
    return GestureDetector(
      onTap: () {
        // untuk bisa dipencet index nya atau inisialisasi ketika ada perubahan state
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal:
                defaultPadding), //karna lagi pake chrome jadi pake manual value dulu harus defaulPadding
        child: Column(
          children: [
            Text(
              categories[index]["text"]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:
                    15, //rapihin aja biar ke tengah gak jelek tadinya gak ada
                color: selectedIndex == index ? secondaryColor : Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top:
                      3 //tadinya pake defaultPadding tapi dia overflowed jadinya pake manual value
                  ),
              height: 2,
              width: 30,
              color: selectedIndex == index ? secondaryColor : Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
