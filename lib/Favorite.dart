import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newaaaa/Provider/favoriteProvider.dart';
import 'package:newaaaa/favoriteScreeen.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavScreen()));
              },
              child: Icon(Icons.favorite))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
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
