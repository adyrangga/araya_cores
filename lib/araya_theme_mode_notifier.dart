import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'araya_prefs.dart';

class ArayaThemeModeNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode _theme = ThemeMode.light;

  ThemeMode get theme {
    var themeMode = ThemeMode.system;
    if (ArayaPrefs.getThemeMode == 1) {
      themeMode = ThemeMode.light;
    } else if (ArayaPrefs.getThemeMode == 2) {
      themeMode = ThemeMode.dark;
    }
    _theme = themeMode;
    return _theme;
  }

  void setTheme(ThemeMode theme) async {
    _theme = theme;
    await ArayaPrefs.setThemeMode(theme);
    notifyListeners();
  }

  /// Makes `AppViewModel` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty('theme', theme));
  }
}
