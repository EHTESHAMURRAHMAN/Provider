import 'package:flutter/material.dart';
import 'package:newaaaa/Provider/favoriteProvider.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteChange>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: provider.selecteditem.length,
          itemBuilder: (context, index) {
            return Consumer<FavoriteChange>(
              builder: (context, value, child) {
                print('rightr');
                return ListTile(
                    onTap: () {
                      value.selecteditem.contains(index)
                          ? value.toggleFavoriteremove(index)
                          : value.toggleFavoriteadd(index);
                      setState(() {});
                    },
                    title: Text('Favorite Item $index'),
                    trailing: value.selecteditem.contains(index)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border_outlined));
              },
            );
          },
        ),
      ),
    );
  }
}
