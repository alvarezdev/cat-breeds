import 'package:cat_breeds/presentation/detail/detail_screen.dart';
import 'package:cat_breeds/presentation/landing/landing_screen.dart';
import 'package:cat_breeds/presentation/splash/splash_screen.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:flutter/material.dart';

class AppRouter {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {

      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case LandingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case DetailScreen.routeName:
        final catBreed = settings.arguments as CatBreed;

        return MaterialPageRoute(
          builder: (_) => DetailScreen(catBreed: catBreed),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route not found")),
          ),
        );
    }
  }
}

