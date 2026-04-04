import 'package:promilaj/data/models/drink_brand.dart';
import 'package:promilaj/data/models/drink_type.dart';
import 'package:promilaj/data/datasources/drink_brands_data.dart';

/// İçki veri repository arayüzü.
/// Gömülü veri kaynağını soyutlar — harici API çağrısı YAPILMAZ.
abstract class IDrinkRepository {
  /// Tüm içki markalarını döndürür.
  List<DrinkBrand> getAllBrands();

  /// Belirli bir [DrinkType] için markaları döndürür.
  List<DrinkBrand> getBrandsByType(DrinkType type);

  /// Belirli bir [DrinkCategory] altındaki tüm alt türleri döndürür.
  List<DrinkType> getTypesByCategory(DrinkCategory category);

  /// Marka adına göre arama yapar (büyük/küçük harf duyarsız).
  List<DrinkBrand> searchBrands(String query, DrinkType type);
}

/// Gömülü veri kaynağından içki bilgilerini sunan implementasyon.
class DrinkRepository implements IDrinkRepository {
  @override
  List<DrinkBrand> getAllBrands() => drinkBrandsData;

  @override
  List<DrinkBrand> getBrandsByType(DrinkType type) {
    return drinkBrandsData.where((b) => b.type == type).toList();
  }

  @override
  List<DrinkType> getTypesByCategory(DrinkCategory category) {
    return DrinkType.values.where((t) => t.category == category).toList();
  }

  @override
  List<DrinkBrand> searchBrands(String query, DrinkType type) {
    final lowerQuery = query.toLowerCase();
    return drinkBrandsData
        .where((b) => b.type == type && b.name.toLowerCase().contains(lowerQuery))
        .toList();
  }
}
