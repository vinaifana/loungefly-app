import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/home/components/banner_image.dart';
import 'package:flutter/material.dart';

class HomeScreenApp extends StatelessWidget {
  const HomeScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2.0
              )
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {}, 
              icon: const Icon(
                Icons.person_outline,
                color: Colors.black,
              )
            ),
          ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2.0
              )
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {}, 
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )
            ),
          ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2.0
              )
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {}, 
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              )
            ),
          ),
        ],
      ),  
      body: const Column(
        children: [
          BannerImage()
        ],
      ),
    );
  }
}