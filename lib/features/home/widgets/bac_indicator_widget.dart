import 'package:flutter/material.dart';
import 'package:promilaj/core/theme/app_colors.dart';

/// BAC gösterge widget'ı — büyük, parlayan, renk değiştiren.
/// Yeşil → amber → kırmızı renk geçişi BAC durumuna göre.
class BacIndicatorWidget extends StatelessWidget {
  final double bac;
  final double legalLimit;

  const BacIndicatorWidget({
    super.key,
    required this.bac,
    required this.legalLimit,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColors.bacColor(bac, legalLimit);
    final bacText = bac.toStringAsFixed(2);

    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(end: color),
      duration: const Duration(milliseconds: 500),
      builder: (context, animColor, child) {
        final displayColor = animColor ?? color;
        return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                displayColor.withAlpha(60),
                displayColor.withAlpha(20),
                Colors.transparent,
              ],
              stops: const [0.0, 0.6, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: displayColor.withAlpha(80),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceDark,
              border: Border.all(
                color: displayColor.withAlpha(150),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bacText,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: displayColor,
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  '‰',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: displayColor.withAlpha(180),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
