import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter/material.dart' hide Builder;

part 'model.g.dart';

final _standardSerializers =
(serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

@SerializersFor([
  ShopItem,
  CartItem,
])
final Serializers serializers = _$serializers;

abstract class ShopItem implements Built<ShopItem, ShopItemBuilder> {
  static Serializer<ShopItem> get serializer => _$shopItemSerializer;

  String get name;
  int get stock;
  Category get category;

  factory ShopItem([void Function(ShopItemBuilder) updates]) = _$ShopItem;
  ShopItem._();

  factory ShopItem.fromJson(Map<String, dynamic> map) {
    return _standardSerializers.deserializeWith(ShopItem.serializer, map);
  }

  Map<String, dynamic> toJson() {
    return _standardSerializers.serializeWith(ShopItem.serializer, this) as Map<String, dynamic>;
  }
}

class Category extends EnumClass {
  static Serializer<Category> get serializer => _$categorySerializer;

  static const Category Essential = _$Essential;
  static const Category Leisure = _$Leisure;
  static const Category Grocery = _$Grocery;

  const Category._(String name) : super(name);

  static BuiltSet<Category> get values => _$values;
  static Category valueOf(String name) => _$valueOf(name);

  IconData get icon {
    switch (this) {
      case Category.Leisure:
        return Icons.extension;
      case Category.Grocery:
        return Icons.fastfood;
      case Category.Essential:
        return Icons.favorite;
    }
  }
}

abstract class CartItem implements Built<CartItem, CartItemBuilder> {
  static Serializer<CartItem> get serializer => _$cartItemSerializer;

  String get name;
  int get quantity;

  factory CartItem([void Function(CartItemBuilder) updates]) = _$CartItem;
  CartItem._();

  factory CartItem.fromJson(Map<String, dynamic> map) {
    return _standardSerializers.deserializeWith(CartItem.serializer, map);
  }
}