import 'package:provider/provider.dart';

import '../../states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'view_model/home_view_model.dart';
import 'widgets/home_content.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ridePreferencesState = context.read<RidePreferencesState>();
    final homeViewModel = HomeViewModel(ridePreferencesState);
    return HomeContent(viewModel: homeViewModel);
  }
}
