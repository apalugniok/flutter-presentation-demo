import 'package:flutter/material.dart';

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