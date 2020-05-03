import 'dart:convert';

import 'package:finished_app/model/model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart';

class ShopBloc {
  Client _client;

  List<ShopItem> _shopContents;
  var _contentsSubject = BehaviorSubject<List<ShopItem>>();
  Stream<List<ShopItem>> get contents => _contentsSubject.stream;

  List<CartItem> _cartContents = [];
  var _cartSubject = BehaviorSubject<List<CartItem>>();
  Stream<List<CartItem>> get cart => _cartSubject.stream;

  ShopBloc(this._client) {
    _fetchShopContents();
    _contentsSubject.add(_shopContents);
    _cartSubject.add(_cartContents);
  }

  void addQuantityToCart(String itemName, int quantity) {
    bool stockAvailable =
        _shopContents.singleWhere((item) => item.name == itemName).stock >=
            quantity;

    var itemAlreadyInCart =
        _cartContents.where((item) => item.name == itemName).isNotEmpty;

    if (stockAvailable) {
      _addStockToShopItem(itemName, -quantity);
    }

    if (itemAlreadyInCart && stockAvailable) {
      _addAmountToCartItem(itemName, quantity);
    }

    if (!itemAlreadyInCart && stockAvailable) {
      _addNewCartItem(itemName, quantity);
    }

    _contentsSubject.add(_shopContents);
    _cartSubject.add(_cartContents);
  }

  void removeQuantityFromCart(String itemName, int quantity) {
    var cartItem = _cartContents.singleWhere((item) => item.name == itemName);

    var canRemoveGivenQuantity = cartItem.quantity >= quantity;

    var itemWillBeRemovedFromCart = cartItem.quantity <= quantity;

    if (!canRemoveGivenQuantity) return;

    _addStockToShopItem(itemName, quantity);

    if (!itemWillBeRemovedFromCart) {
      _addAmountToCartItem(itemName, -quantity);
    } else {
      _removeCartItem(itemName);
    }

    _contentsSubject.add(_shopContents);
    _cartSubject.add(_cartContents);
  }

  void _addAmountToCartItem(String itemName, int quantity) {
    _cartContents = _cartContents.map((item) {
      if (item.name != itemName) return item;

      return item.rebuild((builder) => builder.quantity += quantity);
    }).toList();
  }

  void _addStockToShopItem(String itemName, int stock) {
    _shopContents = _shopContents.map((item) {
      if (item.name != itemName) return item;

      return item.rebuild((builder) => builder.stock += stock);
    }).toList();
  }

  void _addNewCartItem(String name, int quantity) {
    _cartContents = [
      ..._cartContents,
      CartItem((builder) => builder
        ..name = name
        ..quantity = quantity)
    ];
  }

  void _removeCartItem(String name) {
    _cartContents = _cartContents.where((item) => item.name != name).toList();
  }

  void _fetchShopContents() async {
    var response = await _client.get('http://10.0.2.2:5001/contents');
    var json = jsonDecode(response.body) as List<dynamic>;
    _shopContents = json
        .map((dynamic itemMap) =>
            ShopItem.fromJson(itemMap as Map<String, dynamic>))
        .toList();

    _contentsSubject.add(_shopContents);
  }
}
