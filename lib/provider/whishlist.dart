import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  bool isliked = false;
  int? like;
  List<int> favoriteItems = [];

  void favorite(int productId, dynamic products) {
    if (like == productId) {
      like = null;
      favoriteItems.remove(products);
    } else {
      (like = productId);
       favoriteItems.add(products);
    }
    if(like==null)
    notifyListeners();

    // if (favoriteItems.contains(productId)) {
    //   favoriteItems.remove(productId);
    // } else {
    //   favoriteItems.add(productId);
    // }
    
  }

  // bool isFavorite(int productId) {
  //   return favoriteItems.contains(productId);
  // }
}
