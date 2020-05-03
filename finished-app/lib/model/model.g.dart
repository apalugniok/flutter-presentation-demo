// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Category _$Essential = const Category._('Essential');
const Category _$Leisure = const Category._('Leisure');
const Category _$Grocery = const Category._('Grocery');

Category _$valueOf(String name) {
  switch (name) {
    case 'Essential':
      return _$Essential;
    case 'Leisure':
      return _$Leisure;
    case 'Grocery':
      return _$Grocery;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Category> _$values = new BuiltSet<Category>(const <Category>[
  _$Essential,
  _$Leisure,
  _$Grocery,
]);

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(CartItem.serializer)
      ..add(Category.serializer)
      ..add(ShopItem.serializer))
    .build();
Serializer<ShopItem> _$shopItemSerializer = new _$ShopItemSerializer();
Serializer<Category> _$categorySerializer = new _$CategorySerializer();
Serializer<CartItem> _$cartItemSerializer = new _$CartItemSerializer();

class _$ShopItemSerializer implements StructuredSerializer<ShopItem> {
  @override
  final Iterable<Type> types = const [ShopItem, _$ShopItem];
  @override
  final String wireName = 'ShopItem';

  @override
  Iterable<Object> serialize(Serializers serializers, ShopItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'stock',
      serializers.serialize(object.stock, specifiedType: const FullType(int)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(Category)),
    ];

    return result;
  }

  @override
  ShopItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShopItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stock':
          result.stock = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(Category)) as Category;
          break;
      }
    }

    return result.build();
  }
}

class _$CategorySerializer implements PrimitiveSerializer<Category> {
  @override
  final Iterable<Type> types = const <Type>[Category];
  @override
  final String wireName = 'Category';

  @override
  Object serialize(Serializers serializers, Category object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Category deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Category.valueOf(serialized as String);
}

class _$CartItemSerializer implements StructuredSerializer<CartItem> {
  @override
  final Iterable<Type> types = const [CartItem, _$CartItem];
  @override
  final String wireName = 'CartItem';

  @override
  Iterable<Object> serialize(Serializers serializers, CartItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  CartItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ShopItem extends ShopItem {
  @override
  final String name;
  @override
  final int stock;
  @override
  final Category category;

  factory _$ShopItem([void Function(ShopItemBuilder) updates]) =>
      (new ShopItemBuilder()..update(updates)).build();

  _$ShopItem._({this.name, this.stock, this.category}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('ShopItem', 'name');
    }
    if (stock == null) {
      throw new BuiltValueNullFieldError('ShopItem', 'stock');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('ShopItem', 'category');
    }
  }

  @override
  ShopItem rebuild(void Function(ShopItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShopItemBuilder toBuilder() => new ShopItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShopItem &&
        name == other.name &&
        stock == other.stock &&
        category == other.category;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), stock.hashCode), category.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShopItem')
          ..add('name', name)
          ..add('stock', stock)
          ..add('category', category))
        .toString();
  }
}

class ShopItemBuilder implements Builder<ShopItem, ShopItemBuilder> {
  _$ShopItem _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _stock;
  int get stock => _$this._stock;
  set stock(int stock) => _$this._stock = stock;

  Category _category;
  Category get category => _$this._category;
  set category(Category category) => _$this._category = category;

  ShopItemBuilder();

  ShopItemBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _stock = _$v.stock;
      _category = _$v.category;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShopItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ShopItem;
  }

  @override
  void update(void Function(ShopItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShopItem build() {
    final _$result =
        _$v ?? new _$ShopItem._(name: name, stock: stock, category: category);
    replace(_$result);
    return _$result;
  }
}

class _$CartItem extends CartItem {
  @override
  final String name;
  @override
  final int quantity;

  factory _$CartItem([void Function(CartItemBuilder) updates]) =>
      (new CartItemBuilder()..update(updates)).build();

  _$CartItem._({this.name, this.quantity}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('CartItem', 'name');
    }
    if (quantity == null) {
      throw new BuiltValueNullFieldError('CartItem', 'quantity');
    }
  }

  @override
  CartItem rebuild(void Function(CartItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartItemBuilder toBuilder() => new CartItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartItem &&
        name == other.name &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), quantity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CartItem')
          ..add('name', name)
          ..add('quantity', quantity))
        .toString();
  }
}

class CartItemBuilder implements Builder<CartItem, CartItemBuilder> {
  _$CartItem _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  CartItemBuilder();

  CartItemBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _quantity = _$v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CartItem;
  }

  @override
  void update(void Function(CartItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CartItem build() {
    final _$result = _$v ?? new _$CartItem._(name: name, quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
