import 'package:finished_app/bloc/shop_bloc.dart';
import 'package:finished_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../model/model.dart';

var getIt = GetIt.instance;

class ShopItemCard extends StatelessWidget {
  final ShopItem item;

  ShopItemCard({this.item, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: white2, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          Icon(
            item.category.icon,
            size: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.name),
                  Text(
                    '${item.stock} in stock',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              IconButtonWithFeedback(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    getIt<ShopBloc>().addQuantityToCart(item.name, 1);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class IconButtonWithFeedback extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;

  IconButtonWithFeedback({this.onPressed, this.icon, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: IconButton(icon: icon, onPressed: onPressed),
      );
}
