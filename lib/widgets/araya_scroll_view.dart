import 'package:flutter/material.dart';

class ArayaScrollView extends StatelessWidget {
  const ArayaScrollView({
    Key? key,
    required this.childBuilder,
    this.margin = const EdgeInsets.all(8.0),
    this.scrollController,
  }) : super(key: key);

  final Widget Function(BuildContext cContext, BoxConstraints cConstraints)
      childBuilder;
  final EdgeInsetsGeometry margin;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: margin,
              child: childBuilder(context, constraints),
            ),
          ),
        ),
      );
}
