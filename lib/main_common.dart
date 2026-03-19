import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/location/location_repository.dart';
import 'data/repositories/ride/ride_repository.dart';
import 'data/repositories/ride_preference/ride_preference_repository.dart';
import 'ui/theme/theme.dart';
import 'ui/screens/home/home_screen.dart';

void mainCommon({
  required LocationRepository locationRepository,
  required RideRepository rideRepository,
  required RidePreferenceRepository ridePreferenceRepository,
}) {
  runApp(
    MultiProvider(
      providers: [
        Provider<LocationRepository>.value(value: locationRepository),
        Provider<RideRepository>.value(value: rideRepository),
        Provider<RidePreferenceRepository>.value(
          value: ridePreferenceRepository,
        ),
      ],
      child: const BlaBlaApp(),
    ),
  );
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: Scaffold(body: HomeScreen()),
    );
  }
}
