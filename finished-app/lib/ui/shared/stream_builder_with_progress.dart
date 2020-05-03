import 'package:flutter/material.dart';

class StreamBuilderWithProgress<T> extends StreamBuilder<T> {
  StreamBuilderWithProgress(
      {Widget Function(BuildContext, T) builder, Stream<T> stream, Key key})
      : super(
      key: key,
      stream: stream,
      builder: (context, snapshot) {
        return snapshot.data == null ||
            snapshot.connectionState == ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : builder(context, snapshot.data);
      });
}
