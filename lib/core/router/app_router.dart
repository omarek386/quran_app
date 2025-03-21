import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/core/services/API/consumers/dio_consumer.dart';
import 'package:quran_app/features/home/data/sec_api.dart';
import 'package:quran_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:quran_app/features/onboarding/presentation/screens/on_boarding_screen.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/surah/presentation/screens/surah_detail_screen.dart';

class AppRouter {
  Route onGenetationRoute(RouteSettings settings) {
    HomeCubit homeCubit = HomeCubit(apiConsumer: DioConsumer(dio: Dio()));
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => homeCubit,
                child: const HomeScreen(),
              ),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => homeCubit,
                child: const OnBoardingScreen(),
              ),
        );
      case Routes.surahDetail:
        Surah surah = settings.arguments as Surah;
        return MaterialPageRoute(
          builder: (_) => SurahDetailScreen(surah: surah),
        );

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
