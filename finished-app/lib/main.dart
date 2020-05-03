import 'package:finished_app/theme/theme.dart';
import 'package:finished_app/bloc/shop_bloc.dart';
import 'package:finished_app/ui/cart_item_card.dart';
import 'package:finished_app/ui/shared/stream_builder_with_progress.dart';
import 'package:finished_app/ui/shop_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'model/model.dart';

var getIt = GetIt.instance;

void main() {
  getIt.registerSingleton(ShopBloc(Client()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: materialTheme,
      home: MyHomePage(title: 'Shop'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: white2)),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart, color: white2),
                  Text("Cart", style: TextStyle(color: white2))
                ],
              ),
              onPressed: () =>
                  Navigator.of(context).push<void>(transitionTo(CartPage())),
            )
          ],
        ),
        body: StreamBuilderWithProgress<List<ShopItem>>(
            stream: getIt<ShopBloc>().contents,
            builder: (context, contents) {
              return ListView.builder(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: ShopItemCard(item: contents[index]),
                      ),
                  itemCount: contents.length);
            }));
  }
}

Route transitionTo(Widget widget) {
  return PageRouteBuilder<Widget>(
      pageBuilder: (context, animation, _) => widget,
      transitionsBuilder: (context, animation, _, child) {
        var tween = Tween(
            begin: Offset(MediaQuery.of(context).size.width, 0),
            end: Offset(0, 0));
        return Transform.translate(
            offset: tween.animate(animation).value, child: child);
      });
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Cart')),
        body: StreamBuilderWithProgress<List<CartItem>>(
          stream: getIt<ShopBloc>().cart,
          builder: (context, contents) {
            return contents.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) => CartItemCard(
                          item: contents[index],
                          key: ValueKey(contents[index].name),
                        ),
                    itemCount: contents.length)
                : Center(
                    child: Text('Your cart is empty'),
                  );
          },
        ));
  }
}
