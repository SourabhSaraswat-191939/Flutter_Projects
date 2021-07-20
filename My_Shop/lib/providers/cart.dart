import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CartItem {
  final String id; // different Id then the product.
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // Future<void> addItem(String productId, double price, String title) async {
  //   var url =
  //       'https://my-shop-app-3fbd9-default-rtdb.firebaseio.com/cart/${productId}.json';
  //   if (_items.containsKey(productId)) {
  //     _items.update(productId, (existingCartItem) {
  //       return CartItem(
  //         id: existingCartItem.id,
  //         title: existingCartItem.title,
  //         quantity: existingCartItem.quantity + 1,
  //         price: existingCartItem.price,
  //       );
  //     });
  //     print(_items[productId].id);
  //     http.patch(
  //       url,
  //       body: json.encode({
  //         'quantity': _items[productId].quantity + 1,
  //       }),
  //     );

  //   } else {
  //     url = 'https://my-shop-app-3fbd9-default-rtdb.firebaseio.com/cart.json';
  //     await = http.post(
  //       url,
  //       body: json.encode({
  //         'title': title,
  //         'quantity': _items[productId].quantity + 1,
  //         'price': price,
  //       }),
  //     );
  //     _items.putIfAbsent(
  //         productId,
  //         () => CartItem(
  //               id: DateTime.now().toString(),
  //               title: title,
  //               quantity: 1,
  //               price: price,
  //             ));
  //   }
  //   notifyListeners();
  // }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity + 1,
                price: existingCartItem.price,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity - 1,
                title: existingCartItem.title,
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
