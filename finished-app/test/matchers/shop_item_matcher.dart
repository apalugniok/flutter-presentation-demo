import 'package:finished_app/model/model.dart';
import 'package:flutter_test/flutter_test.dart';

class ShopItemMatcher extends Matcher {
  String name;
  int stock;
  Category category;

  ShopItemMatcher(ShopItem item) {
    name = item.name;
    stock = item.stock;
    category = item.category;
  }

  @override
  bool matches(Object item, Map matchState) {
    if (item is ShopItem) {
      return item.name == name && item.stock == stock && item.category == category;
    }

    return false;
  }

  @override
  Description describe(Description description) {
    return description
        .add("Instance of 'ShopItem' with name: '$name', stock: '$stock' and category: '$category'");
  }

  @override
  Description describeMismatch(Object item, Description mismatchDescription,
      Map matchState, bool verbose) {
    if (item is ShopItem) {
      mismatchDescription
          .add("had name '$name', stock: '$stock' and category: '$category'");
    }

    return super
        .describeMismatch(item, mismatchDescription, matchState, verbose);
  }
}