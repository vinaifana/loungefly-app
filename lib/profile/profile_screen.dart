import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/catalogue');
          },
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_rounded,
              color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto profil dengan ikon kamera
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/avatar.png", // Ganti dengan path gambar kamu
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Alisson Becker',
                  style: TextStyle(
                    fontSize: 24,
                    color: themeProvider.isDarkTheme ? Colors.white : const Color(0xFF1A2530),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Full Name Field
              Text(
                'Full Name',
                style: TextStyle(
                  fontSize: defaultPadding,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : const Color(0xFF1A2530),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Alisson Becker',
                  hintStyle: const TextStyle(color: Color(0xFF1A2530)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: defaultPadding),

              // Email Field
              Text(
                'Email Address',
                style: TextStyle(
                  fontSize: defaultPadding,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : const Color(0xFF1A2530),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'allisonbecker@gmail.com',
                  hintStyle: const TextStyle(color: Color(0xFF1A2530)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: defaultPadding),

              // Password Field
              Text(
                'Password',
                style: TextStyle(
                  fontSize: defaultPadding,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : const Color(0xFF1A2530),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                enabled: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '.........',
                  hintStyle: const TextStyle(color: Color(0xFF1A2530)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
