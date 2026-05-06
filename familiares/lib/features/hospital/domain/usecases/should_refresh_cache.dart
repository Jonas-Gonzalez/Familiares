import '../../../../core/network/api_constants.dart';

class ShouldRefreshCache {
  bool call(DateTime? lastUpdate) {
    if (lastUpdate == null) return true;
    return DateTime.now().difference(lastUpdate) > ApiConstants.cacheMaxAge;
  }
}