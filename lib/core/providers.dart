import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promilaj/core/services/country_resolver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:promilaj/data/repositories/user_profile_repository.dart';
import 'package:promilaj/data/repositories/drink_repository.dart';
import 'package:promilaj/data/repositories/session_repository.dart';
import 'package:promilaj/core/utils/location_service.dart';
import 'package:promilaj/features/onboarding/onboarding_view_model.dart';
import 'package:promilaj/features/home/home_view_model.dart';
import 'package:promilaj/features/add_drink/add_drink_view_model.dart';
import 'package:promilaj/features/settings/settings_view_model.dart';
import 'package:promilaj/features/profile/profile_creation_view_model.dart';

/// ═══════════════════════════════════════
/// SharedPreferences — main()'de override edilir
/// ═══════════════════════════════════════
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences main() içinde initialize edilmeli');
});

/// ═══════════════════════════════════════
/// Active Profile State — Aktif profil ID'si
/// ═══════════════════════════════════════
final activeProfileIdProvider = StateProvider<String>((ref) => 'A');

/// ═══════════════════════════════════════
/// Repository Sağlayıcıları
/// ═══════════════════════════════════════
final userProfileRepositoryProvider = Provider<IUserProfileRepository>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return UserProfileRepository(prefs);
});

final drinkRepositoryProvider = Provider<IDrinkRepository>((ref) {
  return DrinkRepository();
});

final sessionRepositoryProvider = Provider<ISessionRepository>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return SessionRepository(prefs);
});

/// ═══════════════════════════════════════
/// Servis Sağlayıcılar
/// ═══════════════════════════════════════
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final countryResolverProvider = Provider<ICountryResolver>((ref) {
  final locationService = ref.read(locationServiceProvider);
  return CountryResolver(locationService);
});

/// ═══════════════════════════════════════
/// ViewModel Sağlayıcıları
/// ═══════════════════════════════════════
final onboardingViewModelProvider =
    ChangeNotifierProvider<OnboardingViewModel>((ref) {
  final userRepo = ref.read(userProfileRepositoryProvider);
  return OnboardingViewModel(userRepo);
});

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final userRepo = ref.read(userProfileRepositoryProvider);
  final sessionRepo = ref.read(sessionRepositoryProvider);
  final locationService = ref.read(locationServiceProvider);
  final countryResolver = ref.read(countryResolverProvider);
  return HomeViewModel(userRepo, sessionRepo, locationService, countryResolver);
});

final addDrinkViewModelProvider =
    ChangeNotifierProvider<AddDrinkViewModel>((ref) {
  final drinkRepo = ref.read(drinkRepositoryProvider);
  return AddDrinkViewModel(drinkRepo);
});

final settingsViewModelProvider =
    ChangeNotifierProvider<SettingsViewModel>((ref) {
  final userRepo = ref.read(userProfileRepositoryProvider);
  return SettingsViewModel(userRepo);
});

final profileCreationViewModelProvider =
    ChangeNotifierProvider<ProfileCreationViewModel>((ref) {
  final userRepo = ref.read(userProfileRepositoryProvider);
  return ProfileCreationViewModel(userRepo);
});
