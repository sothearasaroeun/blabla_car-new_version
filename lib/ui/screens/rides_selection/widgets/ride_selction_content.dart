import 'package:flutter/material.dart';

import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';
import '../view_model/ride_selection_model.dart';
import 'ride_preference_modal.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';

class RideSelectionContent extends StatelessWidget {
  final RideSelectionViewModel viewModel;

  const RideSelectionContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        void onBackTap() => Navigator.pop(context);

        void onFilterPressed() {
          // TODO - same as old
        }

        void onRideSelected(Ride ride) {
          // TODO - same as old
        }

        void onPreferencePressed() async {
          final newPreference = await Navigator.of(context)
              .push<RidePreference>(AnimationUtils.createRightToLeftRoute(
                  RidePreferenceModal(
                    initialPreference: viewModel.currentPreference,
                  ),
                ),
              );

          if (newPreference != null) {
            viewModel.selectPreference(newPreference);
          }
        }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s,
            ),
            child: Column(
              children: [
                RideSelectionHeader(
                  ridePreference: viewModel.currentPreference,
                  onBackPressed: onBackTap,
                  onFilterPressed: onFilterPressed,
                  onPreferencePressed: onPreferencePressed,
                ),
                const SizedBox(height: 100),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.matchingRides.length,
                    itemBuilder: (ctx, index) => RideSelectionTile(
                      ride: viewModel.matchingRides[index],
                      onPressed: () =>
                          onRideSelected(viewModel.matchingRides[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}