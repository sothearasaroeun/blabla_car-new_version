import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/ride/ride_repository.dart';
import '../../states/ride_preference_state.dart';
import 'view_model/ride_selection_model.dart';
import 'widgets/ride_selction_content.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ridePreferencesState = context.read<RidePreferencesState>();
    final rideRepository = context.read<RideRepository>();

    final viewModel = RideSelectionViewModel(
      ridePreferencesState: ridePreferencesState,
      rideRepository: rideRepository,
    );

    return RideSelectionContent(viewModel: viewModel);
  }
}