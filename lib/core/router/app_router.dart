import 'package:flutter/material.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/features/onboarding/presentation/screens/on_boarding_screen.dart';

import '../../features/home/presentation/screens/home_screen.dart';

class AppRouter {
  Route onGenetationRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                appBar: AppBar(title: const Text('Error')),
                body: const Center(child: Text('Page not found')),
              ),
        );
    }
  }
}
