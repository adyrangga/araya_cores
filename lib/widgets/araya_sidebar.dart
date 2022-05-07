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
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: ArayaConstants.appDrawerWidth,
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.5),
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                primary: false,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                children: children,
              ),
            ),
            const ArayaTileSwitchTheme(),
          ],
        ),
      );
    });
  }
}
