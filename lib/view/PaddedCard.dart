import 'package:flutter/material.dart';

class PaddedCard extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  PaddedCard({
    this.padding: const EdgeInsets.all(8.0),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: padding,
      child: new Card(
        color: Theme.of(context).cardColor,
        child: child,
      ),
    );
  }
}
