import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'feature/home/presentation/pages/home_page.dart';
import 'feature/home/presentation/provider/home_provider.dart';
import 'feature/map/presentation/pages/map_page.dart';
import 'feature/map/presentation/provider/map_provider.dart';
import 'feature/navigation/presentation/pages/navigation_page.dart';
import 'feature/welcome/presentation/pages/welcome_page.dart';

void main() {
  runApp(const SinportApp());
}

class SinportApp extends StatelessWidget {
  const SinportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<MapProvider>(create: (_) => MapProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sinport UI',
        theme: AppTheme.darkTheme,
        initialRoute: WelcomePage.routeName,
        routes: {
          WelcomePage.routeName: (_) => const WelcomePage(),
          HomePage.routeName: (_) => const HomePage(),
          MapPage.routeName: (_) => const MapPage(),
          NavigationPage.routeName: (_) => const NavigationPage(),
        },
      ),
    );
  }
}
