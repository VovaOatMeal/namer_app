import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  void removeFavorite(MyAppState appState, int index) {
    var favorites = appState.favorites;
    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    return favorites.isEmpty
        ? Center(child: Text("You haven't liked any phrases yet."))
        : SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Text("You have ${favorites.length} favorites:"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: favorites.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          onPressed: () => removeFavorite(appState, index),
                          icon: Icon(Icons.favorite),
                        ),
                        title: Text(appState.favorites[index].asPascalCase),
                      );
                    },
                  ),
                ),
              ],
            ),
        );
  }
}
