import 'dart:collection';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteItemSavedProvider extends ChangeNotifier {
  List<WordPair> _saved = [];
  UnmodifiableListView<WordPair> get getSaved => UnmodifiableListView(_saved);
  void addFavoriteItem(WordPair pair){
    _saved.add(pair);
    notifyListeners();
  }
  void removeFavoriteItem(WordPair pair){
    _saved.remove(pair);
    notifyListeners();
  }
}