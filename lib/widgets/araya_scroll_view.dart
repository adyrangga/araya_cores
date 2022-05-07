import 'package:flutter/material.dart';

class ArayaScrollView extends StatelessWidget {
  const ArayaScrollView({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
    this.scrollController,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) => Expanded(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      );
}
