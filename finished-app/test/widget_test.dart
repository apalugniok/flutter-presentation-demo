import 'dart:convert';

import 'package:finished_app/bloc/shop_bloc.dart';
import 'package:finished_app/model/model.dart';
import 'package:finished_app/ui/shop_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finished_app/main.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'matchers/cart_item_matcher.dart';

class MockClient extends Mock implements Client {}

void main() {
  var client = MockClient();

  tearDownAll(() => GetIt.instance.reset());

  test('standart failing test', () async {
    var expectedCartItem = CartItemMatcher(CartItem((builder) => builder
      ..name = 'Foo'
      ..quantity = 1));

    var actualCartItem = CartItem((builder) => builder
      ..name = 'Bar'
      ..quantity = 2);

    expect(actualCartItem, expectedCartItem, reason: 'boo');
  });

  testWidgets('a rather long widget test', (widgetTester) async {
    var shopItem = (ShopItemBuilder()
          ..name = 'Cheese'
          ..category = Category.Essential
          ..stock = 2)
        .build();

    when(client.get('http://10.0.2.2:5001/contents'))
        .thenAnswer((_) => Future.value(Response(jsonEncode([shopItem]), 200)));
    GetIt.instance.registerSingleton(ShopBloc(client));

    await widgetTester.pumpWidget(MyApp());
    await widgetTester.pump();

    var shopItemAddToCartButtonFinder = find.descendant(
        of: find.byType(ShopItemCard),
        matching: find.byIcon(Icons.shopping_cart));
    expect(shopItemAddToCartButtonFinder, findsOneWidget);

    await widgetTester.tap(shopItemAddToCartButtonFinder);
    await widgetTester.pump();

    expect(find.text('1 in stock'), findsOneWidget);

    await widgetTester.tap(find.text('Cart'));
    await widgetTester.pumpAndSettle();

    expect(find.text('Your Cart'), findsOneWidget);
    expect(find.text('Cheese'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);

    await widgetTester.tap(find.byIcon(Icons.arrow_drop_down));

    await widgetTester.pumpAndSettle();

    expect(find.text('Cheese'), findsNothing);
  });
}
