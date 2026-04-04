import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promilaj/core/providers.dart';
import 'package:promilaj/core/theme/app_colors.dart';
import 'package:promilaj/core/theme/widgets/glass_card.dart';
import 'package:promilaj/data/models/user_profile.dart';
import 'package:promilaj/features/home/home_view.dart';
import 'package:promilaj/l10n/app_localizations.dart';
import 'package:promilaj/features/shared/widgets/language_picker_list.dart';
import 'package:promilaj/features/shared/widgets/country_picker_list.dart';

/// Onboarding ekranı — ilk açılışta gösterilir.
/// Boy, kilo, cinsiyet ve yaş bilgilerini toplar.
class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeIn;

  final _heightController = TextEditingController(text: '170');
  final _weightController = TextEditingController(text: '70');
  final _ageController = TextEditingController(text: '25');

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(onboardingViewModelProvider);
    final l10n = AppLocalizations.of(context);
    
    if (l10n == null) {
      return const Scaffold(backgroundColor: AppColors.midnight);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.surface, AppColors.midnight],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeIn,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        // Başlık
                        Text(
                          l10n.welcomeTitle,
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.welcomeSubtitle,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),

                        // Dil Seçimi
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.languageLabel,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              LanguagePickerList(
                                selectedLanguage: vm.selectedLanguage,
                                onLanguageSelected: (langCode) {
                                  vm.setLanguage(langCode);
                                  // Anında UI dilini değiştir
                                  ref
                                      .read(settingsViewModelProvider.notifier)
                                      .setLocale(Locale(langCode));
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Ülke Seçimi
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.countryLabel,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              CountryPickerList(
                                selectedCountryCode: vm.selectedCountryCode,
                                onCountrySelected: (code) =>
                                    vm.setCountryCode(code),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Boy
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.heightLabel,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _heightController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                ),
                                decoration: InputDecoration(
                                  suffixText: 'cm',
                                  hintText: l10n.heightHint,
                                ),
                                onChanged: (v) {
                                  final val = double.tryParse(v);
                                  if (val != null) vm.setHeight(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Kilo
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.weightLabel,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                ),
                                decoration: InputDecoration(
                                  suffixText: 'kg',
                                  hintText: l10n.weightHint,
                                ),
                                onChanged: (v) {
                                  final val = double.tryParse(v);
                                  if (val != null) vm.setWeight(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Cinsiyet
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.sexLabel,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: _SexOption(
                                      label: l10n.male,
                                      icon: CupertinoIcons.person,
                                      isSelected: vm.sex == BiologicalSex.male,
                                      onTap: () =>
                                          vm.setSex(BiologicalSex.male),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _SexOption(
                                      label: l10n.female,
                                      icon: CupertinoIcons.person,
                                      isSelected:
                                          vm.sex == BiologicalSex.female,
                                      onTap: () =>
                                          vm.setSex(BiologicalSex.female),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Yaş
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.ageLabel,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _ageController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                ),
                                decoration: InputDecoration(
                                  hintText: l10n.ageHint,
                                ),
                                onChanged: (v) {
                                  final val = int.tryParse(v);
                                  if (val != null) vm.setAge(val);
                                },
                              ), // TextField
                            ], // Column's children inside GlassCard
                          ), // Column inside GlassCard
                        ), // GlassCard
                      ], // children of inner Column
                    ), // inner Column
                  ), // SingleChildScrollView
                ), // Expanded
              ], // children of outer Column
            ), // outer Column
          ), // FadeTransition
        ), // SafeArea
      ), // Container
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: vm.isValid && !vm.isSaving
                  ? () => _onContinue(vm)
                  : null,
              child: vm.isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.continueButton),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onContinue(dynamic vm) async {
    final success = await vm.saveProfile();
    if (success && mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeView()));
    }
  }
}

/// Cinsiyet seçim butonu
class _SexOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SexOption({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withAlpha(30)
              : AppColors.glassSubtle,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.accent : AppColors.glassBorder,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.accent : AppColors.textSecondary,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.accent : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
