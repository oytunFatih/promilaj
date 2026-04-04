import 'package:promilaj/core/utils/location_service.dart';
import 'package:promilaj/data/models/session_profile.dart';

abstract class ICountryResolver {
  /// Returns the ISO country code to use for legal calculations.
  /// Priority: manual selection > GPS detection > fallback ('XX')
  String resolveCountryCode(SessionProfile profile);
}

class CountryResolver implements ICountryResolver {
  final LocationService _locationService;

  CountryResolver(this._locationService);

  @override
  String resolveCountryCode(SessionProfile profile) {
    if (profile.selectedCountryCode != null) {
      return profile.selectedCountryCode!; // manual override wins
    }
    return _locationService.countryCode ?? 'XX'; // GPS fallback
  }
}
