import 'package:araya_cores/widgets/araya_drawer.dart';
import 'package:flutter/material.dart';

import '../araya_constants.dart';
import '../screen_size.dart';
import 'araya_scroll_view.dart';

/// Creates a widget that avoids operating system interfaces.
class ArayaScaffold extends StatelessWidget {
  /// Creates a widget that avoids operating system interfaces.
  ///
  /// choose one of [bodyBuilder] or [body] to build body widget.
  const ArayaScaffold({
    Key? key,
    this.appBar,
    this.appBarTitle = ArayaConstants.appsName,
    this.sideBar,
    this.drawer = const ArayaDrawer(),
    this.bodyBuilder,
    this.body,
    this.backgroundColor,
    this.scrollController,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final String appBarTitle;
  final Widget? sideBar;
  final Widget? drawer;
  final Widget Function(BuildContext context, BoxConstraints constraints)?
      bodyBuilder;
  final Widget? body;
  final Color? backgroundColor;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            color: backgroundColor,
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: body ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sideBar ?? const SizedBox(),
                    ArayaScrollView(
                      scrollController: scrollController,
                      child: bodyBuilder!(context, constraints),
                    ),
                  ],
                ),
          ),
        ),
      ),
      drawer: screenSize.isMobile() || screenSize.isMobileLS() ? drawer : null,
    );
  }

  _buildAppbar(BuildContext context) {
    if (appBar == null) return AppBar(title: Text(appBarTitle));
    return appBar;
  }
}
