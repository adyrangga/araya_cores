import 'package:araya_cores/widgets/araya_tile_switch_theme.dart';
import 'package:flutter/material.dart';

import '../araya_constants.dart';
import '../screen_size.dart';

class ArayaSidebar extends StatelessWidget {
  const ArayaSidebar(
    this.screenSize, {
    Key? key,
    this.children = const [],
    this.backgroundColor,
  }) : super(key: key);

  final ScreenSize screenSize;
  final List<Widget> children;
  final Color? backgroundColor;

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
          ListView(
            primary: false,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            children: children,
          ),
          const ArayaTileSwitchTheme(),
        ],
      ),
    );
  }
}
