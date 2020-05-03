import 'package:finished_app/model/model.dart';
import 'package:finished_app/bloc/shop_bloc.dart';
import 'package:finished_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

class CartItemCard extends StatefulWidget {
  final CartItem item;

  CartItemCard({this.item, Key key}) : super(key: key);

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: white2, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('${widget.item.name}'),
            Row(
              children: <Widget>[
                IconButtonWithFeedback(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                        getIt<ShopBloc>().removeQuantityFromCart(widget.item.name, 1);
                    }),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: white1),
                      child: Center(
                          child: Text(
                            '${widget.item.quantity}',
                            style: TextStyle(fontSize: 24),
                          ))),
                ),
                IconButtonWithFeedback(
                    icon: Icon(Icons.arrow_drop_up),
                    onPressed: () => getIt<ShopBloc>()
                        .addQuantityToCart(widget.item.name, 1)),
              ],
            )
          ],
        ),
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
