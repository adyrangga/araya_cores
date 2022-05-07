import 'package:flutter/material.dart';

import '../araya_constants.dart';
import 'araya_scroll_view.dart';

/// Creates a widget that avoids operating system interfaces.
class ArayaScaffold extends StatelessWidget {
  /// Creates a widget that avoids operating system interfaces.
  ///
  /// choose one of [bodyBuilder] or [tabBarVIewBody] to build body widget.
  const ArayaScaffold({
    Key? key,
    this.appBar,
    this.appBarTitle = ArayaConstants.appsName,
    this.sideBar = const SizedBox(),
    this.drawer,
    this.bodyBuilder,
    this.tabBarVIewBody,
    this.backgroundColor,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final String appBarTitle;
  final Widget sideBar;
  final Widget? drawer;
  final Widget Function(BuildContext cContext, BoxConstraints cConstraints)?
      bodyBuilder;
  final Widget? tabBarVIewBody;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            color: backgroundColor,
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: tabBarVIewBody ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    sideBar,
                    ArayaScrollView(childBuilder: bodyBuilder!),
                  ],
                ),
          ),
        ),
      ),
      drawer: drawer,
    );
  }

  _buildAppbar(BuildContext context) {
    if (appBar == null) return AppBar(title: Text(appBarTitle));
    return appBar;
  }
}
