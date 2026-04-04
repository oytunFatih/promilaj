import 'package:promilaj/data/models/drink_type.dart';

/// Kullanıcının eklediği tek bir içki kaydı.
/// [consumedAt] alanı gerçek tüketim zamanını tutar; böylece
/// "kaç saat önce" hesabı her an doğru kalır.
class DrinkEntry {
  final String id;
  final String brandName;
  final DrinkType drinkType;
  final double abv;
  final double volumeMl;

  /// İçkinin tüketildiği zaman damgası
  final DateTime consumedAt;

  /// Kaydın uygulamaya eklendiği zaman damgası
  final DateTime addedAt;
  
  /// Kullanıcının "Other" seçerek kendi girdiği ABV mi?
  final bool isManualAbv;

  const DrinkEntry({
    required this.id,
    required this.brandName,
    required this.drinkType,
    required this.abv,
    required this.volumeMl,
    required this.consumedAt,
    required this.addedAt,
    this.isManualAbv = false,
  });

  /// Tüketimden bu yana geçen saat sayısı (anlık hesap)
  double get hoursAgo =>
      DateTime.now().difference(consumedAt).inSeconds / 3600.0;

  /// JSON dönüşümü — SharedPreferences ile kayıt için
  Map<String, dynamic> toJson() => {
        'id': id,
        'brandName': brandName,
        'drinkType': drinkType.name,
        'abv': abv,
        'volumeMl': volumeMl,
        'consumedAt': consumedAt.toIso8601String(),
        'addedAt': addedAt.toIso8601String(),
        'isManualAbv': isManualAbv,
      };

  /// JSON'dan nesne oluşturma
  factory DrinkEntry.fromJson(Map<String, dynamic> json) => DrinkEntry(
        id: json['id'] as String,
        brandName: json['brandName'] as String,
        drinkType: DrinkType.values.byName(json['drinkType'] as String),
        abv: (json['abv'] as num).toDouble(),
        volumeMl: (json['volumeMl'] as num).toDouble(),
        consumedAt: DateTime.parse(json['consumedAt'] as String),
        addedAt: DateTime.parse(json['addedAt'] as String),
        isManualAbv: json['isManualAbv'] as bool? ?? false,
      );
}
