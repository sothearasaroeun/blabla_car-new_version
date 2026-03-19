import 'package:flutter/material.dart';

import '../../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../../widgets/pickers/bla_ride_preference_picker.dart';
import '../home_screen.dart';
import '../view_model/home_view_model.dart';
import '../../rides_selection/rides_selection_screen.dart';
import 'home_history_tile.dart';

import '/utils/animations_util.dart';

class HomeContent extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        void onRidePrefSelected(RidePreference selectedPreference) {
          viewModel.selectPreference(selectedPreference);

          Navigator.of(context).push(
            AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()),
          );
        }

        return Stack(
          children: [_buildBackground(), _buildForeground(onRidePrefSelected)],
        );
      },
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(blablaHomeImagePath, fit: BoxFit.cover),
    );
  }

  Widget _buildForeground(void Function(RidePreference) onRidePrefSelected) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 100),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              BlaRidePreferencePicker(
                initRidePreference: viewModel.currentPreference,
                onRidePreferenceSelected: onRidePrefSelected,
              ),
              const SizedBox(height: BlaSpacings.m),
              _buildHistory(onRidePrefSelected),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(void Function(RidePreference) onRidePrefSelected) {
    final history = viewModel.history.reversed.toList();

    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () => onRidePrefSelected(history[index]),
        ),
      ),
    );
  }
}