import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:promilaj/core/theme/app_colors.dart';
import 'package:promilaj/features/onboarding/onboarding_view.dart';
import 'package:promilaj/l10n/app_localizations.dart';

class FirstLaunchInfoView extends StatelessWidget {
  const FirstLaunchInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.midnight,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.surface, AppColors.midnight],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      l10n.infoPlaceholderText,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('info_screen_shown', true);
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const OnboardingView()),
                        );
                      }
                    },
                    child: Text(l10n.infoScreenNext),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
