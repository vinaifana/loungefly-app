import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key,});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool enableFaceID = false;
  bool enablePushNotifications = true;
  bool enableLocationServices = true;
  bool isDarkTheme = false;

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
            'Account And Settings',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            }, 
            icon: Icon(themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode),
            color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding),
              child: Text(
                "Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildAccountItem(Icons.notifications_active_rounded, 'Notification Setting', () {
            }),
            buildDivider(),
            buildAccountItem(Icons.location_history_rounded, 'Shipping Address', () {
            }),
            buildDivider(),
            buildAccountItem(Icons.wallet_rounded, 'Payment Info', () {
            }),
            buildDivider(),
            buildAccountItem(Icons.delete_rounded, 'Delete Account', () {
            }),
            buildDivider(),
            const SizedBox(height: 20),

            // Bagian App Settings
            Text(
              'App Settings',
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            buildSwitchItem('Enable Face ID For Log In', enableFaceID, (value) {
              setState(() {
                enableFaceID = value;
              });
            }),
            buildSwitchItem('Enable Push Notifications', enablePushNotifications, (value) {
              setState(() {
                enablePushNotifications = value;
              });
            }),
            buildSwitchItem('Enable Location Services', enableLocationServices, (value) {
              setState(() {
                enableLocationServices = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget buildAccountItem(IconData icon, String text, VoidCallback onTap) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
        child: Row(
          children: [
            Icon(
              icon, 
              size: 24,
              color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text, 
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ))),
            Icon(
              Icons.chevron_right, 
              color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchItem(String text, bool initialValue, ValueChanged<bool> onChanged) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text, 
              style: TextStyle(
                fontSize: 16,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ))),
          Switch(
            value: initialValue,
            onChanged: onChanged,
            activeColor: secondaryColor,
          ),
        ],
      ),
    );
  }
}  

Widget buildDivider() {
  return Container(
    height: 1,
    color: const Color.fromARGB(238, 224, 224, 224),
  );
}

