import 'package:araya_cores/widgets/araya_tile_switch_theme.dart';
import 'package:flutter/material.dart';

import '../araya_constants.dart';
import '../screen_size.dart';
import 'araya_scroll_view.dart';

class ArayaSidebar extends StatelessWidget {
  const ArayaSidebar(
    this.screenSize, {
    Key? key,
    required this.child,
    this.backgroundColor,
    this.scrollController,
  }) : super(key: key);

  final ScreenSize screenSize;
  final Widget child;
  final Color? backgroundColor;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    if (screenSize.isMobile() || screenSize.isMobileLS()) {
      return const SizedBox();
    }
    return Container(
      width: ArayaConstants.appDrawerWidth,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.25),
            blurRadius: 8,
          )
        ],
      ),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ArayaScrollView(scrollController: scrollController, child: child),
          const ArayaTileSwitchTheme(),
        ],
      ),
    );
  }
}
