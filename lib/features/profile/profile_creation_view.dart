import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promilaj/core/providers.dart';
import 'package:promilaj/core/theme/app_colors.dart';
import 'package:promilaj/core/theme/widgets/glass_card.dart';
import 'package:promilaj/data/models/user_profile.dart';
import 'package:promilaj/l10n/app_localizations.dart';

/// Misafir profili (Profile B) oluşturma bottom sheet.
/// Onboarding formuyla aynı alanları taşır: boy, kilo, cinsiyet, yaş.
class ProfileCreationView extends ConsumerStatefulWidget {
  const ProfileCreationView({super.key});

  @override
  ConsumerState<ProfileCreationView> createState() =>
      _ProfileCreationViewState();
}

class _ProfileCreationViewState extends ConsumerState<ProfileCreationView> {
  final _heightController = TextEditingController(text: '170');
  final _weightController = TextEditingController(text: '70');
  final _ageController = TextEditingController(text: '25');

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(profileCreationViewModelProvider);
    final l10n = AppLocalizations.of(context);
    
    if (l10n == null) return const SizedBox.shrink();

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                // Tutma çubuğu
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.glassBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Başlık
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 48),
                      Text(
                        l10n.addGuestProfile,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        icon: const Icon(CupertinoIcons.xmark),
                        onPressed: () {
                          vm.reset();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(color: AppColors.glassBorder, height: 1),

                // Form içeriği
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),

                        // Başlık açıklama
                        Text(
                          l10n.guestProfileDesc,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),

                        // Boy
                        GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.heightLabel,
                                style:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _heightController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                    color: AppColors.textPrimary),
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
                                style:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                    color: AppColors.textPrimary),
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
                                style:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: _SexOption(
                                      label: l10n.male,
                                      icon: CupertinoIcons.person,
                                      isSelected:
                                          vm.sex == BiologicalSex.male,
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
                                style:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _ageController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(
                                    color: AppColors.textPrimary),
                                decoration: InputDecoration(
                                  hintText: l10n.ageHint,
                                ),
                                onChanged: (v) {
                                  final val = int.tryParse(v);
                                  if (val != null) vm.setAge(val);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Oluştur butonu
                        SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            onPressed:
                                vm.isValid && !vm.isSaving
                                    ? () => _onCreate(vm)
                                    : null,
                            child: vm.isSaving
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  )
                                : Text(l10n.addGuestProfile),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onCreate(dynamic vm) async {
    final profile = await vm.createProfile();
    if (profile != null && mounted) {
      vm.reset();
      Navigator.pop(context, profile);
    }
  }
}

/// Cinsiyet seçim butonu (Onboarding ile aynı tasarım)
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
