import 'package:flutter/foundation.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preference_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState _ridePreferencesState;

  HomeViewModel(this._ridePreferencesState) {
    _ridePreferencesState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference? get currentPreference => _ridePreferencesState.currentPreference;
  List<RidePreference> get history => _ridePreferencesState.history;

  void selectPreference(RidePreference preference) {
    _ridePreferencesState.selectPreference(preference);
  }

  @override
  void dispose() {
    _ridePreferencesState.removeListener(_onStateChanged);
    super.dispose();
  }
}
