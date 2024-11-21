import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/profile/profile_screen.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/ui/cart/cart.dart';
import 'package:e_commerce/ui/detail/components/detail_screen.dart';
import 'package:e_commerce/ui/home/components/banner_image.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:e_commerce/wishlist/favorite_screen.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatefulWidget {
  
  const CatalogueScreen({
    super.key,
  });

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {

  int _selectedIndex = 0;

   final List<Widget> _widgetOptions = [
    const CatalogueScreen(), // Home
    const FavoriteScreen(),   // Wishlist
    const SettingsScreen(), // Settings
    const ProfileScreen(),   // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // final List<Map<String, dynamic>> navItems = [
  //   {
  //     'icon' : Icons.home, 
  //     'label' : "Home"
  //   },
  //   {
  //     'icon' : Icons.favorite, 
  //     'label' : "Favorite"
  //   },
  //   {
  //     'icon' : Icons.settings, 
  //     'label' : "Settings"
  //   },
  //   {
  //     'icon' : Icons.person, 
  //     'label' : "Profile"
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen())
              );
            }, 
            icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),

      body: _selectedIndex == 0 
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "New & Tranding",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black
              ),
              ),
          ),
          const SizedBox(height: 14),
          const BannerImage(),
          const Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              // gridview untuk menampilkan ui nya
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => ItemCard(
                  product: products[index], //index mulai dari nol dan karna dia tipe data list 
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: products[index])
                    )
                  )
                ),
              ),
            )
          )
        ],
      )
      //  : adalah representasi dari ternary operator
      : _widgetOptions[_selectedIndex], // Tampilkan widget berdasarkan index
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      )
    );
  }
}