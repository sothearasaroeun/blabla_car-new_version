import '../../../data/dummy_data.dart';
import '../../../model/ride/ride.dart';
import 'ride_repository.dart';

class MockRideRepository implements RideRepository {
  @override
  List<Ride> getAllRides() {
    return fakeRides;
  }
}
