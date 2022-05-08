import 'package:flutter/material.dart';

/// creates hover effects & tab able for this child
class ArayaHovered extends StatelessWidget {
  /// creates hover effects & tab able for this child
  ///
  /// [child] required widget.
  ///
  /// [onTap] callback function when this widget tapped.
  ///
  /// [visibled] define the visibility of this widget & child.
  ///
  /// [disabled] & [readOnly] default false. if true, prevent [onTap] function.
  ///
  /// [padding] define padding between this hovering effect with child.
  const ArayaHovered({
    Key? key,
    required this.child,
    required this.onTap,
    this.visibled = true,
    this.disabled = false,
    this.readOnly = false,
    this.margin,
    this.padding,
    this.tooltip = '',
  }) : super(key: key);

  final Widget child;
  final Function()? onTap;
  final bool visibled;
  final bool disabled;
  final bool readOnly;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String tooltip;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: InkWell(
          onTap: disabled || readOnly ? null : onTap,
          child: visibled
              ? Container(
                  padding: padding,
                  child: Tooltip(message: tooltip, child: child),
                )
              : const SizedBox(),
        ),
      );
}
