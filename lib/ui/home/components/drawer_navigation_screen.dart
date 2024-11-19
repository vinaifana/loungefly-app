// import 'package:e_commerce/settings/settings_screen.dart';
// import 'package:flutter/material.dart';

// class DrawerNavigation extends StatelessWidget {
//   final bool isDarkTheme;
//   final Function(bool) onThemeChanged; // Ubah tipe fungsi sesuai dengan toggle

//   const DrawerNavigation({
//     super.key,
//     required this.isDarkTheme,
//     required this.onThemeChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Drawer Header',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SettingsScreen(
//                     isDarkTheme: isDarkTheme,
//                     onThemeChanged: onThemeChanged, // Panggil fungsi toggle
//                   ),
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.train),
//             title: const Text('Page 2'),
//             onTap: () {
//               Navigator.pop(context);
//               // Navigasi ke Page 2
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
