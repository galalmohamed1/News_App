import 'dart:developer';
import 'package:news_app/module/home/home_view.dart';
import 'package:news_app/module/splash/splash_view.dart';

import '/core/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    log('Route: ${settings.name}');
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
        case PagesRouteName.Home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );


      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}