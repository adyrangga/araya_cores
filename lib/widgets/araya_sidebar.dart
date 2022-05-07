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
      return Material(
        elevation: 4,
        child: SizedBox(
          width: ArayaConstants.appDrawerWidth,
          height: constraints.maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [],
                ),
              ),
              const ArayaTileSwitchTheme(),
            ],
          ),
        ),
      );
    });
  }
}
