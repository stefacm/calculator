import 'package:flutter/widgets.dart';

class ResponsiveConfig extends InheritedWidget {
  final double scale;

  const ResponsiveConfig({
    required this.scale,
    required super.child,
    super.key,
  });

  static ResponsiveConfig of(BuildContext context) {
    final cfg = context.dependOnInheritedWidgetOfExactType<ResponsiveConfig>();
    assert(cfg != null, 'ResponsiveConfig not found in context; wrap your tree with one.');
    return cfg!;
  }

  @override
  bool updateShouldNotify(covariant ResponsiveConfig oldWidget) => scale != oldWidget.scale;
}
