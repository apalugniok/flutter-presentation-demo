import 'package:finished_app/model/model.dart';
import 'package:flutter_test/flutter_test.dart';

class CartItemMatcher extends Matcher {
  String name;
  int quantity;

  CartItemMatcher(CartItem item) {
    name = item.name;
    quantity = item.quantity;
  }

  @override
  bool matches(Object item, Map matchState) {
    if (item is CartItem) {
      return item.name == name && item.quantity == quantity;
    }

    return false;
  }

  @override
  Description describe(Description description) {
    return description
        .add("Instance of 'CartItem' with name: '$name' and quantity: '$quantity'");
  }

  @override
  Description describeMismatch(Object item, Description mismatchDescription,
      Map matchState, bool verbose) {
    if (item is CartItem) {
      mismatchDescription
          .add("had name: '${item.name}' and quantity: '${item.quantity}'");
    }

    return super
        .describeMismatch(item, mismatchDescription, matchState, verbose);
  }
}
