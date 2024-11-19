// import 'package:e_commerce/consts.dart';
// import 'package:flutter/material.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState 
// extends State<BottomNavBar> {  //generic di tandai dengan lambang gdg
//   //ini adalah variable untuk menandakan dimualinya index unutk proses navigasi
//   int _selectedIndex = 0;
//   //variable untuk inisialisasi text styling
//   // static const TextStyle optionStyle = 
//   // TextStyle(
//   //   fontSize: 30,
//   //   fontWeight: FontWeight.bold,
//   // );

//   //variable untuk menyimpan List dari component navigasi --> label/Text
//    final List<Map<String, dynamic>> navItems = [
//     {
//       "icon" : 'assets/icons/fi-rr-home.svg',
//       "label" : "Home",
//       "route" : '/catalogue'
//     },
//     {
//       "icon" : 'assets/icons/fi-rr-shopping-bag.svg',
//       "label" : "Explore",
//       "route" : '/favourite'
//     },
//     {
//       "icon" : 'assets/icons/fi-rr-heart.svg',
//       "label" : "Wishlist",
//       "route" : '/settings'
//     },
//     {
//       "icon" : 'assets/icons/fi-rr-user.svg',
//       "label" : "Profile",
//       "route" : '/profile'
//     },
//   ];

//   // membuat satu function untuk menandakan awal terjadinya state
//   void _onItemTapped(int index) { //_onItemTapped  adalah function yang akan dipanggil ketika user menekan salah satu item di bottom navigation bar
//     setState(() { //digunakan untuk mengubah tampilan yang ditampilkan di layar saat item navigasi dipilih.
//       _selectedIndex = index;
//     });
//     Navigator.pushNamed(context, '/catalogue');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("${navItems[_selectedIndex]['label']}"),
//       ) ,
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             key: Key('/catalogue'),
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             key: Key('/favorite'),
//             icon: Icon(Icons.favorite),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             key: Key('/settings'),
//             icon: Icon(Icons.settings),
//             label: 'Setting',
//           ),
//           BottomNavigationBarItem(
//             key: Key('/profile'),
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: primaryColor,
//         onTap: (index) {
//         Navigator.pushNamed(context, navItems[index]['route']);
//         }
//         )
//     );
//   }
// }

import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({super.key, 
  required this.selectedIndex, 
  required this.onItemTapped
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: secondaryColor,
          ),
          label: "Home"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: secondaryColor,
          ),
          label: "Favorite"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: secondaryColor,
          ),
          label: "Settings"
        ),      
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: secondaryColor,
          ),
          label: "Profile"
        ),      
      ],
      currentIndex: selectedIndex,
      selectedItemColor: secondaryColor,
      onTap: onItemTapped,
    );
  }
}