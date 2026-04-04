import 'package:flutter/material.dart';
import 'package:promilaj/core/theme/app_colors.dart';
import 'package:promilaj/core/theme/widgets/glass_card.dart';

/// Geri sayım widget'ı — HH:MM:SS formatında süre gösterir.
/// Yasal limite veya sıfıra kalan süre için kullanılır.
class CountdownWidget extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;
  final Color? accentColor;

  const CountdownWidget({
    super.key,
    required this.label,
    required this.time,
    required this.icon,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? AppColors.accent;

    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: color,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
