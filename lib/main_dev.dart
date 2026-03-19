import 'main_common.dart';
import 'data/repositories/location/location_repository_mock.dart';
import 'data/repositories/ride/ride_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preference_repository_mock.dart';

void mainDev() {
  final locationRepository = MockLocationRepository();
  final rideRepository = MockRideRepository();
  final ridePreferenceRepository = MockRidePreferenceRepository();

  mainCommon(
    locationRepository: locationRepository,
    rideRepository: rideRepository,
    ridePreferenceRepository: ridePreferenceRepository,
  );
}
