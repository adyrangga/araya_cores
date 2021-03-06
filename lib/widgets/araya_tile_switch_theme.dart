import 'package:araya_cores/araya_theme_mode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../araya_constants.dart';

class ArayaTileSwitchTheme extends StatelessWidget {
  const ArayaTileSwitchTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          ArayaConstants.darkMode,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        trailing: Tooltip(
          message: ArayaConstants.toggleDarkMode,
          child: Switch(
            value:
                context.watch<ArayaThemeModeNotifier>().theme == ThemeMode.dark,
            onChanged: (isDark) {
              var theme = isDark ? ThemeMode.dark : ThemeMode.light;
              context.read<ArayaThemeModeNotifier>().setTheme(theme);
            },
          ),
        ),
      );
}
