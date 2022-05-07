import 'package:flutter/material.dart';

class ArayaScrollView extends StatelessWidget {
  const ArayaScrollView({
    Key? key,
    required this.childBuilder,
    this.padding = const EdgeInsets.all(8.0),
    this.scrollController,
  }) : super(key: key);

  final Widget Function(BuildContext cContext, BoxConstraints cConstraints)
      childBuilder;
  final EdgeInsetsGeometry padding;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          controller: scrollController,
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            padding: padding,
            child: childBuilder(context, constraints),
          ),
        ),
      );
}
