import 'dart:ui';

import 'package:flutter/material.dart';

import 'glassmorph_config.dart';

/// A customizable Glassmorphism container widget.
class Glassmorph extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? glassEffect;
  final Color? glassBGColor;
  final Color? glassBorder;
  final bool enableGlassBorder;

  const Glassmorph({
    super.key,
    required this.child,
    this.padding,
    this.glassBGColor,
    this.enableGlassBorder = false,
    this.glassBorder,
    this.glassEffect,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final config = GlassmorphConfig.fromInput(
      padding: padding,
      borderRadius: borderRadius,
      blur: glassEffect,
      backgroundColor: glassBGColor,
      enableBorder: enableGlassBorder,
      borderColor: glassBorder,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(config.borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: config.blur, sigmaY: config.blur),
        child: Container(
          padding: config.padding,
          decoration: BoxDecoration(
            color: config.backgroundColor,
            borderRadius: BorderRadius.circular(config.borderRadius),
            border: config.showBorder
                ? Border.all(color: config.borderColor!, width: 1.5)
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
