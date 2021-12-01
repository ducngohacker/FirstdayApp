import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/favorite_items_page.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/provider_favorite_items.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<FavoriteItemSavedProvider>(
      create: (_) => FavoriteItemSavedProvider(),
      child: MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(),
      ),
    );
  }
// #enddocregion build
}
// #enddocregion MyApp

// #docregion RWS-var
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  // #enddocregion RWS-var

  // #docregion _buildSuggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider();
          /*2*/

          final index = i ~/ 2; /*3*/

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {
    bool isSaved =
        Provider.of<FavoriteItemSavedProvider>(context).getSaved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        
          if (isSaved) {
            Provider.of<FavoriteItemSavedProvider>(context,listen: false).removeFavoriteItem(pair);
          } else {
            Provider.of<FavoriteItemSavedProvider>(context,listen: false).addFavoriteItem(pair);
          }
        
      },
    );
  }

  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const FavoriteItemsListViewPage();
                  },
                ),
              );
            },
            child: const Icon(
              Icons.menu,
            ),
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }
// #enddocregion RWS-build
// #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}
