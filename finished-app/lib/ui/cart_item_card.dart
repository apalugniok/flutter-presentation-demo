import 'package:finished_app/model/model.dart';
import 'package:finished_app/bloc/shop_bloc.dart';
import 'package:finished_app/theme/theme.dart';
import 'package:finished_app/ui/shared/icon_button_with_feedback.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

class CartItemCard extends StatefulWidget {
  final CartItem item;

  CartItemCard({this.item, Key key}) : super(key: key);

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurveTween(curve: Curves.easeIn)
        .chain(Tween<double>(begin: 1, end: 0))
        .animate(_controller)
          ..addListener(() {
            if (_animation.isCompleted) {
              getIt<ShopBloc>().removeQuantityFromCart(widget.item.name, 1);
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: Padding(
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
                        if (widget.item.quantity == 1) {
                          _controller.forward();
                        } else {
                          getIt<ShopBloc>()
                              .removeQuantityFromCart(widget.item.name, 1);
                        }
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
      ),
      builder: (context, child) => FadeTransition(
        opacity: _animation,
        child: SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1,
          child: child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
