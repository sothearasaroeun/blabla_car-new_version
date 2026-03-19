import 'package:flutter/foundation.dart';
import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferenceRepository _repository;

  RidePreference? currentPreference;
  List<RidePreference> history = [];

  RidePreferencesState(this._repository) {
    history = _repository.getHistory();
  }

  void selectPreference(RidePreference newPreference) {
    if (currentPreference == null || currentPreference != newPreference) {
      currentPreference = newPreference;

      _repository.addToHistory(newPreference);
      history = _repository.getHistory();

      notifyListeners();
    }
  }
}
