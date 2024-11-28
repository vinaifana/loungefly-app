import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/catalogue');
          },
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        title: const Text("Favorite"),
      ),
      body: favoriteProvider.favoriteItems.isEmpty
      ? const Center(child: Text("Your Favorite is Empty"))
      : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding,
          childAspectRatio: 0.75
        ),
        itemCount: favoriteProvider.favoriteItems.length,
        itemBuilder: (context, index) {
          final favoriteItem = favoriteProvider.favoriteItems.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(favoriteItem.image),
              ),
              title: Text(favoriteItem.title),
              trailing: IconButton(
                onPressed: () {
                  favoriteProvider.removeItemFromFav(favoriteItem.id);
                }, 
                icon: const Icon(Icons.delete)
              )
            ),
          );
        }
      )
    );
  }
}
