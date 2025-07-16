import 'package:flutter/material.dart';

/// Internal config holder for glassmorphism settings
class GlassmorphConfig {
  final EdgeInsets padding;
  final double borderRadius;
  final double blur;
  final Color backgroundColor;
  final bool showBorder;
  final Color? borderColor;

  const GlassmorphConfig({
    required this.padding,
    required this.borderRadius,
    required this.blur,
    required this.backgroundColor,
    required this.showBorder,
    this.borderColor,
  });

  /// Factory constructor to build from public widget input
  factory GlassmorphConfig.fromInput({
    EdgeInsets? padding,
    double? borderRadius,
    double? blur,
    Color? backgroundColor,
    bool enableBorder = false,
    Color? borderColor,
  }) {
    return GlassmorphConfig(
      padding: padding ?? const EdgeInsets.all(15),
      borderRadius: borderRadius ?? 25.0,
      blur: blur ?? 15.0,
      backgroundColor: (backgroundColor ?? Colors.white).withValues(alpha: 0.2),
      showBorder: enableBorder || borderColor != null,
      borderColor:
          borderColor?.withValues(alpha: 0.3) ??
          Colors.white.withValues(alpha: 0.3),
    );
  }
}
