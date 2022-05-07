import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'araya_constants.dart';

/// abstact class for changes application title.
/// call setAppsDesc method inner build method before returns widget.
abstract class AppsDescription {
  @mustCallSuper
  void setAppsDesc(
    BuildContext context, [
    String title = ArayaConstants.appsName,
  ]) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: title,
        primaryColor: Theme.of(context).primaryColor.value,
      ),
    );
  }
}
