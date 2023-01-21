import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'package:movies/providers/providers.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.lightTheme);
  }
}
