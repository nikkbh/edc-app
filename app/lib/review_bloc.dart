import 'package:flutter/material.dart';

class ReviewBloc with ChangeNotifier{
  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;
  // List<Member> _cart =
  

  void addToCart(index) {
    if (cart.containsKey(index)) {
      cart[index] += 1;
    } else {
      cart[index] = 1;
    }
    notifyListeners();
  }

  void clear(index) {
    if (cart.containsKey(index)) {
      cart.remove(index);
      notifyListeners();
    }
  }
}