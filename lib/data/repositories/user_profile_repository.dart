import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:promilaj/data/models/user_profile.dart';
import 'package:promilaj/data/models/session_profile.dart';

/// Kullanıcı profili repository arayüzü.
/// SOLID: Bağımlılık tersine çevirme — UI katmanı bu arayüze bağımlıdır.
abstract class IUserProfileRepository {
  /// Kaydedilmiş profili yükler. Yoksa null döner.
  Future<UserProfile?> loadProfile();

  /// Profili yerel depolamaya kaydeder.
  Future<void> saveProfile(UserProfile profile);

  /// Profil var mı kontrolü (onboarding atlamak için).
  Future<bool> hasProfile();

  // ── Multi-Profile Desteği ──

  /// Tüm session profillerini yükler (A ve varsa B).
  Future<List<SessionProfile>> loadAllSessionProfiles();

  /// Belirli bir session profilini yükler.
  Future<SessionProfile?> loadSessionProfile(String profileId);

  /// Session profilini kaydeder.
  Future<void> saveSessionProfile(SessionProfile profile);

  /// Session profilini siler.
  Future<void> deleteSessionProfile(String profileId);

  /// Misafir profili (B) var mı?
  Future<bool> hasGuestProfile();
}

/// SharedPreferences tabanlı profil repository implementasyonu.
class UserProfileRepository implements IUserProfileRepository {
  final SharedPreferences _prefs;

  /// SharedPreferences anahtarları
  static const String _profileKey = 'user_profile';
  static const String _sessionProfilePrefix = 'session_profile_';

  UserProfileRepository(this._prefs);

  // ── Eski Tek Profil API (geriye uyumluluk) ──

  @override
  Future<UserProfile?> loadProfile() async {
    try {
      final jsonStr = _prefs.getString(_profileKey);
      if (jsonStr == null) return null;
      final map = json.decode(jsonStr) as Map<String, dynamic>;
      return UserProfile.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveProfile(UserProfile profile) async {
    final jsonStr = json.encode(profile.toJson());
    await _prefs.setString(_profileKey, jsonStr);
  }

  @override
  Future<bool> hasProfile() async {
    return _prefs.containsKey(_profileKey) ||
        _prefs.containsKey('${_sessionProfilePrefix}A');
  }

  // ── Multi-Profile API ──

  @override
  Future<List<SessionProfile>> loadAllSessionProfiles() async {
    final profiles = <SessionProfile>[];

    // Profile A
    final profileA = await loadSessionProfile('A');
    if (profileA != null) profiles.add(profileA);

    // Profile B
    final profileB = await loadSessionProfile('B');
    if (profileB != null) profiles.add(profileB);

    return profiles;
  }

  @override
  Future<SessionProfile?> loadSessionProfile(String profileId) async {
    try {
      final jsonStr = _prefs.getString('$_sessionProfilePrefix$profileId');
      if (jsonStr == null) return null;
      final map = json.decode(jsonStr) as Map<String, dynamic>;
      return SessionProfile.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveSessionProfile(SessionProfile profile) async {
    final jsonStr = json.encode(profile.toJson());
    await _prefs.setString('$_sessionProfilePrefix${profile.id}', jsonStr);

    // Profile A ise eski formatı da güncelle (geriye uyumluluk)
    if (profile.id == 'A') {
      await saveProfile(profile.toUserProfile());
    }
  }

  @override
  Future<void> deleteSessionProfile(String profileId) async {
    await _prefs.remove('$_sessionProfilePrefix$profileId');
  }

  @override
  Future<bool> hasGuestProfile() async {
    return _prefs.containsKey('${_sessionProfilePrefix}B');
  }
}
