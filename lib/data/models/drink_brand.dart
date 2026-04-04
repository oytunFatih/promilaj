import 'package:promilaj/data/models/drink_type.dart';

/// İçki markası modeli.
/// Gömülü veri kaynağından okunan marka bilgilerini temsil eder.
class DrinkBrand {
  /// Marka adı (ör. "Heineken", "Jack Daniel's")
  final String name;

  /// İçki alt türü (ör. lager, whisky)
  final DrinkType type;

  /// Alkol hacim yüzdesi (ör. 5.0 = %5)
  final double abv;

  const DrinkBrand({
    required this.name,
    required this.type,
    required this.abv,
  });
}
