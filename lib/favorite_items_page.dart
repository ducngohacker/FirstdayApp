import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/provider_favorite_items.dart';

class FavoriteItemsListViewPage extends StatelessWidget {
  const FavoriteItemsListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggestion Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount:
        Provider.of<FavoriteItemSavedProvider>(context).getSaved.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  children: [
                    Text('${index + 1}'),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      Provider.of<FavoriteItemSavedProvider>(context)
                          .getSaved[index]
                          .asPascalCase,
                      style: const TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2.5,
              )
            ],
          );
        },
      ),
    );
  }
}
