import 'package:flutter/material.dart';
import 'package:promilaj/core/theme/app_colors.dart';
import 'package:promilaj/l10n/app_localizations.dart';

/// Uygulama pop-up'ları.
/// Su hatırlatıcısı, yasal limit uyarısı ve konum izni dialogları.
class AppPopups {
  AppPopups._();

  /// 💧 Su hatırlatıcısı — 2. içkiden sonra gösterilir
  static void showWaterReminder(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        icon: const Text('💧', style: TextStyle(fontSize: 48)),
        title: Text(l10n.waterReminderTitle),
        content: Text(l10n.waterReminderMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  /// ⚠️ Yasal limit aşımı uyarısı — sadece geçiş anında tetiklenir
  static void showLegalLimitWarning(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        icon: const Text('⚠️', style: TextStyle(fontSize: 48)),
        title: Text(
          l10n.legalWarningTitle,
          style: const TextStyle(color: AppColors.bacDanger),
        ),
        content: Text(l10n.legalWarningMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  /// 📍 Konum izni dialogu — neden gerektiğini açıklar
  static void showLocationPermissionDialog(
      BuildContext context, VoidCallback onGrant) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        icon: const Text('📍', style: TextStyle(fontSize: 48)),
        title: Text(l10n.locationPermissionTitle),
        content: Text(l10n.locationPermissionMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.continueWithoutLocation),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              onGrant();
            },
            child: Text(l10n.grantPermission),
          ),
        ],
      ),
    );
  }
}
