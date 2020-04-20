import 'package:flutter/material.dart';

class ReviewBloc with ChangeNotifier {
  Map<int, int> _cart = {};
   List<String> items =
      new List<String>.generate(30, (i) => "Names ${i + 1}");

  Map<int, int> get cart => _cart;

  void addToCart(index) {
    if (_cart.containsKey(index)) {
      _cart[index] += 1;
    } else {
      _cart[index] = 1;
    }
    notifyListeners();
  }

  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}