import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:promilaj/data/models/drink_entry.dart';

/// Aktif oturum repository arayüzü.
/// İçki kayıtlarını yönetir — profil bazlı ayrılmıştır.
abstract class ISessionRepository {
  /// Belirli bir profil için tüm aktif içki kayıtlarını yükler.
  Future<List<DrinkEntry>> loadEntries({String profileId = 'A'});

  /// Belirli bir profil için yeni bir içki kaydı ekler.
  Future<void> addEntry(DrinkEntry entry, {String profileId = 'A'});

  /// Belirli bir profilin tüm kayıtlarını siler (sıfırla butonu).
  Future<void> clearAll({String profileId = 'A'});

  /// Belirli bir profilin toplam eklenen içki sayısını döndürür.
  Future<int> getEntryCount({String profileId = 'A'});
}

/// SharedPreferences tabanlı oturum repository implementasyonu.
/// İçki kayıtları profil bazlı ayrı key'lerde saklanır:
///   drink_entries_A → Profile A
///   drink_entries_B → Profile B
class SessionRepository implements ISessionRepository {
  final SharedPreferences _prefs;

  /// SharedPreferences anahtar prefix'i
  static const String _entriesPrefix = 'drink_entries_';

  SessionRepository(this._prefs);

  /// Profil bazlı key oluştur
  String _keyFor(String profileId) => '$_entriesPrefix$profileId';

  @override
  Future<List<DrinkEntry>> loadEntries({String profileId = 'A'}) async {
    try {
      final jsonStr = _prefs.getString(_keyFor(profileId));
      if (jsonStr == null) return [];
      final list = json.decode(jsonStr) as List<dynamic>;
      return list
          .map((e) => DrinkEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> addEntry(DrinkEntry entry, {String profileId = 'A'}) async {
    final entries = await loadEntries(profileId: profileId);
    entries.add(entry);
    await _saveEntries(entries, profileId: profileId);
  }

  @override
  Future<void> clearAll({String profileId = 'A'}) async {
    await _prefs.remove(_keyFor(profileId));
  }

  @override
  Future<int> getEntryCount({String profileId = 'A'}) async {
    final entries = await loadEntries(profileId: profileId);
    return entries.length;
  }

  /// Kayıt listesini JSON olarak saklar
  Future<void> _saveEntries(
    List<DrinkEntry> entries, {
    String profileId = 'A',
  }) async {
    final jsonStr = json.encode(entries.map((e) => e.toJson()).toList());
    await _prefs.setString(_keyFor(profileId), jsonStr);
  }
}
