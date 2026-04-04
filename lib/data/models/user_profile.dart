/// Kullanıcı profili modeli.
/// Onboarding ekranında toplanan ve yerel olarak saklanan kişisel veriler.
/// Widmark formülündeki r-faktörü için biyolojik cinsiyet gereklidir.

/// Biyolojik cinsiyet — Widmark dağılım faktörünü belirler
enum BiologicalSex {
  male,   // r = 0.68
  female, // r = 0.55
}

class UserProfile {
  /// Boy (santimetre)
  final double heightCm;

  /// Kilo (kilogram)
  final double weightKg;

  /// Biyolojik cinsiyet
  final BiologicalSex sex;

  /// Yaş (yıl)
  final int age;

  const UserProfile({
    required this.heightCm,
    required this.weightKg,
    required this.sex,
    required this.age,
  });

  /// JSON dönüşümü — SharedPreferences ile kayıt için
  Map<String, dynamic> toJson() => {
        'heightCm': heightCm,
        'weightKg': weightKg,
        'sex': sex.name,
        'age': age,
      };

  /// JSON'dan nesne oluşturma
  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        heightCm: (json['heightCm'] as num).toDouble(),
        weightKg: (json['weightKg'] as num).toDouble(),
        sex: BiologicalSex.values.byName(json['sex'] as String),
        age: json['age'] as int,
      );

  /// Güncelleme kolaylığı için kopyalama metodu
  UserProfile copyWith({
    double? heightCm,
    double? weightKg,
    BiologicalSex? sex,
    int? age,
  }) {
    return UserProfile(
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      sex: sex ?? this.sex,
      age: age ?? this.age,
    );
  }
}
