import 'package:flutter/foundation.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preference_state.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState _ridePreferencesState;
  final RideRepository _rideRepository;

  RideSelectionViewModel({
    required RidePreferencesState ridePreferencesState,
    required RideRepository rideRepository,
  }) : _ridePreferencesState = ridePreferencesState,
       _rideRepository = rideRepository { _ridePreferencesState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference get currentPreference => _ridePreferencesState.currentPreference!;

  List<Ride> get matchingRides {
    return _rideRepository
        .getAllRides()
        .where((ride) => ride.departureLocation == currentPreference.departure && ride.arrivalLocation == currentPreference.arrival)
        .toList();
  }

  void selectPreference(RidePreference newPref) {
    _ridePreferencesState.selectPreference(newPref);
  }

  @override
  void dispose() {
    _ridePreferencesState.removeListener(_onStateChanged);
    super.dispose();
  }
}