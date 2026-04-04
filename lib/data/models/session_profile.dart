import 'dart:ui' as ui;
import 'package:promilaj/data/models/user_profile.dart';

/// Çoklu profil desteği için oturum profili modeli.
/// Mevcut UserProfile'ı genişletir — her profil kendi BAC takibine sahiptir.
/// Mimari N profil desteği için hazırdır; şimdilik max 2 profil (A + B).
class SessionProfile {
  /// Profil kimliği — 'A' (birincil) veya 'B' (misafir)
  final String id;

  /// Boy (santimetre)
  final double heightCm;

  /// Kilo (kilogram)
  final double weightKg;

  /// Biyolojik cinsiyet
  final BiologicalSex sex;

  /// Yaş (yıl)
  final int age;

  /// Seçilen dil ('tr', 'en' vb.)
  final String selectedLanguage;

  /// Seçilen ülke kodu (Manuel seçim. Otomatik için null)
  final String? selectedCountryCode;

  const SessionProfile({
    required this.id,
    required this.heightCm,
    required this.weightKg,
    required this.sex,
    required this.age,
    required this.selectedLanguage,
    this.selectedCountryCode,
  });

  /// Eski UserProfile'dan SessionProfile oluşturma (migrasyon için)
  factory SessionProfile.fromLegacyUserProfile(UserProfile legacy) {
    return SessionProfile(
      id: 'A',
      heightCm: legacy.heightCm,
      weightKg: legacy.weightKg,
      sex: legacy.sex,
      age: legacy.age,
      selectedLanguage: 'en', // V1 legacy varsayılanı (v1.0.3 ile migration)
      selectedCountryCode: null, // GPS otomatik
    );
  }

  /// UserProfile'a dönüştürme (geriye uyumluluk)
  UserProfile toUserProfile() {
    return UserProfile(
      heightCm: heightCm,
      weightKg: weightKg,
      sex: sex,
      age: age,
    );
  }

  /// JSON dönüşümü — SharedPreferences ile kayıt için
  Map<String, dynamic> toJson() => {
        'id': id,
        'heightCm': heightCm,
        'weightKg': weightKg,
        'sex': sex.name,
        'age': age,
        'selectedLanguage': selectedLanguage,
        'selectedCountryCode': selectedCountryCode,
      };

  /// JSON'dan nesne oluşturma
  factory SessionProfile.fromJson(Map<String, dynamic> json) => SessionProfile(
        id: json['id'] as String,
        heightCm: (json['heightCm'] as num).toDouble(),
        weightKg: (json['weightKg'] as num).toDouble(),
        sex: BiologicalSex.values.byName(json['sex'] as String),
        age: json['age'] as int,
        selectedLanguage: json['selectedLanguage'] as String? ?? _getDeviceLocale(),
        selectedCountryCode: json['selectedCountryCode'] as String?,
      );

  static String _getDeviceLocale() {
    try {
      final localeCode = ui.PlatformDispatcher.instance.locale.languageCode;
      return ['tr', 'az', 'en', 'es', 'fr'].contains(localeCode) ? localeCode : 'en';
    } catch (_) {
      return 'en';
    }
  }

  /// Güncelleme kolaylığı için kopyalama metodu
  SessionProfile copyWith({
    String? id,
    double? heightCm,
    double? weightKg,
    BiologicalSex? sex,
    int? age,
    String? selectedLanguage,
    String? selectedCountryCode,
  }) {
    return SessionProfile(
      id: id ?? this.id,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedCountryCode: selectedCountryCode ?? this.selectedCountryCode,
    );
  }
}
