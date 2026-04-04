import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:promilaj/core/constants/selection_data.dart';
import 'package:promilaj/core/theme/app_colors.dart';
import 'package:promilaj/l10n/app_localizations.dart';

class CountryPickerList extends StatelessWidget {
  final String? selectedCountryCode;
  final ValueChanged<String?> onCountrySelected;

  const CountryPickerList({
    super.key,
    required this.selectedCountryCode,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const SizedBox.shrink();

    // Otomatik algılama öğesini listeye ekle
    final items = [
      {'code': null, 'name': l10n.autoDetect, 'flag': '🌍'},
      ...supportedCountries,
    ];

    // Ensure value exists in items list to prevent DropdownButton assertion crash
    final bool valueExists = items.any((item) => item['code'] == selectedCountryCode);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          value: valueExists ? selectedCountryCode : null,
          isExpanded: true,
          dropdownColor: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(CupertinoIcons.chevron_down, size: 16, color: AppColors.accent),
          selectedItemBuilder: (BuildContext context) {
            return items.map((item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${item['flag']} ${item['name']}',
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
                ),
              );
            }).toList();
          },
          items: items.map((item) {
            final isSelected = item['code'] == selectedCountryCode;
            return DropdownMenuItem<String?>(
              value: item['code'],
              child: Row(
                children: [
                  Text(item['flag'] ?? '', style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item['name'] ?? '',
                      style: TextStyle(
                        color: isSelected ? AppColors.accent : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (isSelected)
                    const Icon(CupertinoIcons.check_mark, color: AppColors.accent, size: 16),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            onCountrySelected(value);
          },
        ),
      ),
    );
  }
}
