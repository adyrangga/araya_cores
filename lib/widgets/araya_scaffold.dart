import 'package:flutter/material.dart';

import '../araya_constants.dart';
import 'araya_scroll_view.dart';

class ArayaScaffold extends StatelessWidget {
  const ArayaScaffold({
    Key? key,
    this.appBar,
    this.appBarTitle = ArayaConstants.appsName,
    this.sideBar = const SizedBox(),
    this.drawer,
    this.childBuilder,
    this.tabBarVIewBody,
    this.backgroundColor,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final String appBarTitle;
  final Widget sideBar;
  final Widget? drawer;
  final Widget Function(BuildContext cContext, BoxConstraints cConstraints)?
      childBuilder;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sideBar,
                    ArayaScrollView(childBuilder: childBuilder!),
                  ],
                ),
          ),
        ),
      ),
      drawer: drawer,
    );
  }

  _buildAppbar(BuildContext context) {
    if (appBar == null) return null;

    return AppBar(title: Text(appBarTitle));
  }
}
