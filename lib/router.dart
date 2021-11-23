// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/pages/home_screen.dart';
import 'package:movie_app/features/login/presentation/pages/login_screen.dart';
import 'package:movie_app/features/splash/presentation/pages/splashscreen.dart';

abstract class Routes {
  static const SPLASH = '/splash';
  static const MOVIES = '/movies';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
}

abstract class AppPages {
  static final Map<String, Widget Function(BuildContext)> pages = {
    Routes.SPLASH: (context) => const SplashScreen(),
    Routes.LOGIN: (context) => const LoginScreen(),
    Routes.MOVIES: (context) => const HomeScreen(),
  };
}
