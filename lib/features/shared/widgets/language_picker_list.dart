import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:promilaj/core/constants/selection_data.dart';
import 'package:promilaj/core/theme/app_colors.dart';

class LanguagePickerList extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  const LanguagePickerList({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: supportedLanguages.any((l) => l['code'] == selectedLanguage)
              ? selectedLanguage
              : supportedLanguages.first['code'],
          isExpanded: true,
          dropdownColor: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(CupertinoIcons.chevron_down, size: 16, color: AppColors.accent),
          selectedItemBuilder: (BuildContext context) {
            return supportedLanguages.map((lang) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${lang['flag']} ${lang['name']}',
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
                ),
              );
            }).toList();
          },
          items: supportedLanguages.map((lang) {
            final isSelected = lang['code'] == selectedLanguage;
            return DropdownMenuItem<String>(
              value: lang['code'],
              child: Row(
                children: [
                  Text(lang['flag'] ?? '', style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 12),
                  Text(
                    lang['name'] ?? '',
                    style: TextStyle(
                      color: isSelected ? AppColors.accent : AppColors.textPrimary,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  if (isSelected)
                    const Icon(CupertinoIcons.check_mark, color: AppColors.accent, size: 16),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onLanguageSelected(value);
            }
          },
        ),
      ),
    );
  }
}
