import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:promilaj/core/theme/app_colors.dart';

/// Profil değiştirme pill/toggle widget'ı.
/// Profile B varken gösterilir — A ve B arasında geçiş yapar.
/// Liquid Glass tasarım diliyle uyumlu.
class ProfileSwitcherWidget extends StatelessWidget {
  final String activeProfileId;
  final bool hasGuestProfile;
  final ValueChanged<String> onSwitch;

  const ProfileSwitcherWidget({
    super.key,
    required this.activeProfileId,
    required this.hasGuestProfile,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasGuestProfile) return const SizedBox.shrink();

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.glassWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.glassBorder,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPill(context, 'A', activeProfileId == 'A'),
              const SizedBox(width: 4),
              _buildPill(context, 'B', activeProfileId == 'B'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPill(BuildContext context, String profileId, bool isActive) {
    return GestureDetector(
      onTap: () => onSwitch(profileId),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.accent.withAlpha(40) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? AppColors.accent : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          profileId,
          style: TextStyle(
            color: isActive ? AppColors.accent : AppColors.textSecondary,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
            fontSize: 15,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
