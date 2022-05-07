import 'package:flutter/material.dart';

import '../araya_constants.dart';
import 'araya_tile_switch_theme.dart';

class ArayaDrawer extends StatelessWidget {
  const ArayaDrawer({
    Key? key,
    this.drawerHeader,
    this.children = const [],
  }) : super(key: key);

  final Widget? drawerHeader;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              drawerHeader ??
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      ArayaConstants.appsName,
                      style: Theme.of(context).primaryTextTheme.headline6,
                    ),
                    margin: EdgeInsets.zero,
                  ),
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
      }),
    );
  }
}
