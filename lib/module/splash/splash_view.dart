import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_assets.dart';
import 'package:news_app/core/routes/app_routes_name.dart';
import 'package:news_app/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),() {
          navigatorKey.currentState!.pushNamedAndRemoveUntil(PagesRouteName.Home, (route) => false,);
        },
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Image(image: AssetImage(AppAssets.NewsLogo)),
      ),
    );
  }
}
