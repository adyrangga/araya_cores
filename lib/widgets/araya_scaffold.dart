import 'package:flutter/foundation.dart' show kIsWeb;
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
    this.drawer,
    this.forceImplyLeading = false,
    this.bodyBuilder,
    this.body,
    this.bodyPadding = const EdgeInsets.all(8.0),
    this.backgroundColor,
    this.scrollController,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final String appBarTitle;
  final Widget? sideBar;
  final Widget? drawer;

  /// [forceImplyLeading] force show appBar leading when drawer not null;
  final bool forceImplyLeading;
  final Widget Function(BuildContext context, BoxConstraints constraints)?
      bodyBuilder;
  final Widget? body;
  final EdgeInsetsGeometry bodyPadding;
  final Color? backgroundColor;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    return Scaffold(
      appBar: _buildAppbar(context, screenSize),
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
                      padding: bodyPadding,
                      scrollController: scrollController,
                      child: bodyBuilder!(context, constraints),
                    ),
                  ],
                ),
          ),
        ),
      ),
      drawer: forceImplyLeading ||
              (screenSize.isMobile() || screenSize.isMobileLS())
          ? drawer
          : null,
    );
  }

  _buildAppbar(BuildContext context, ScreenSize screenSize) {
    if (appBar == null) {
      bool hasDrawer = drawer != null;
      return AppBar(
        title: Text(appBarTitle),
        automaticallyImplyLeading: ((kIsWeb || hasDrawer) &&
                (screenSize.width <= screenSize.maxMobileLSWidth &&
                    hasDrawer)) ||
            (forceImplyLeading && hasDrawer),
      );
    }
    return appBar;
  }
}
