import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:promilaj/core/theme/app_colors.dart';

/// Cam efektli buton widget'ı.
/// Buzlu cam görünümü + basma animasyonu.
class GlassButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final double? width;

  const GlassButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    this.backgroundColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Material(
            color: backgroundColor ?? AppColors.glassWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: const BorderSide(color: AppColors.glassBorder),
            ),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(borderRadius),
              splashColor: AppColors.accent.withAlpha(30),
              highlightColor: AppColors.accent.withAlpha(15),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
