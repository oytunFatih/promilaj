import 'dart:math';
import 'package:promilaj/core/constants/constants.dart';
import 'package:promilaj/data/models/drink_entry.dart';
import 'package:promilaj/data/models/user_profile.dart';

/// Widmark formülüyle BAC hesaplama motoru.
/// Tüm hesaplama mantığı bu sınıfta toplanmıştır — UI katmanında iş mantığı YOKTUR.
///
/// Formül:
///   BAC (g/L) = Σ(alkol_gram_i / (vücut_ağırlığı × r)) − (β × saat_i)
///   alkol_gram = hacim_ml × (abv/100) × 0.789
///   r = 0.68 (erkek), 0.55 (kadın)
///   β = 0.15 g/L/h
///   BAC minimum 0.0
class BacCalculator {
  BacCalculator._(); // Sınıf örneklemesini engelle

  /// Tek bir içki kaydı için alkol gram miktarını hesaplar.
  static double calculateAlcoholGrams(double volumeMl, double abv) {
    return volumeMl * (abv / 100.0) * kAlcoholDensity;
  }

  /// Belirli bir kullanıcı profili ve içki listesi için anlık BAC değerini hesaplar (‰).
  /// Her içkinin katkısı ayrı ayrı hesaplanır, sonra toplanır.
  static double calculateBac({
    required UserProfile profile,
    required List<DrinkEntry> entries,
  }) {
    if (entries.isEmpty) return 0.0;

    // Widmark dağılım faktörü
    final r = profile.sex == BiologicalSex.male
        ? kWidmarkFactorMale
        : kWidmarkFactorFemale;

    double totalBac = 0.0;

    for (final entry in entries) {
      final alcoholGrams = calculateAlcoholGrams(entry.volumeMl, entry.abv);
      final hoursAgo = entry.hoursAgo;

      // Her içkinin bireysel katkısı
      final contribution = (alcoholGrams / (profile.weightKg * r))
          - (kEliminationRate * hoursAgo);

      // Negatif katkıları yok say — o içki çoktan metabolize olmuş
      if (contribution > 0) {
        totalBac += contribution;
      }
    }

    // BAC asla negatif olamaz
    return max(0.0, totalBac);
  }

  /// Yasal limite ulaşmak için gereken süreyi hesaplar (saat).
  /// BAC zaten limitin altındaysa 0.0 döner.
  static double hoursToLegalLimit(double currentBac, double legalLimit) {
    if (currentBac <= legalLimit) return 0.0;
    return (currentBac - legalLimit) / kEliminationRate;
  }

  /// BAC'nin sıfıra ulaşması için gereken süreyi hesaplar (saat).
  static double hoursToZero(double currentBac) {
    if (currentBac <= 0.0) return 0.0;
    return currentBac / kEliminationRate;
  }

  /// Saat değerini HH:MM:SS formatına çevirir.
  static String formatDuration(double hours) {
    if (hours <= 0) return '00:00:00';
    final totalSeconds = (hours * 3600).round();
    final h = totalSeconds ~/ 3600;
    final m = (totalSeconds % 3600) ~/ 60;
    final s = totalSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')}';
  }
}
