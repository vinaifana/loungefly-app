import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Best Seller",
    "Halloween",
    "Back In Stock",
    "New Arrivals",
    "Denim",
    "Exclusive"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          //untuk menampung data yang akan di UI atau screen
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index ) => _buildCategory(index),
        ),
      )
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
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding), //karna lagi pake chrome jadi pake manual value dulu harus defaulPadding
          child: Column(
            children: [
              Text(
                categories[index],
                style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15, //rapihin aja biar ke tengah gak jelek tadinya gak ada
                color: selectedIndex == index ? secondaryColor : Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 3 //tadinya pake defaultPadding tapi dia overflowed jadinya pake manual value
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