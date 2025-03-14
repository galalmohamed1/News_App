import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/theme/app_theme_manager.dart';
import 'package:news_app/module/home/home_view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
GlobalKey<NavigatorState> navigatorKey= GlobalKey<NavigatorState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(

      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
          child: const MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<HomeViewModel>(context);
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: provider.currentTheme,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      navigatorKey: navigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
    );

  }
}