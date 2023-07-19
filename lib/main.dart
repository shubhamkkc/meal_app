import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/provider/favrouite_meal_provider.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:meal_app/provider/meals_data_provider.dart';
import 'package:meal_app/screen/tabs.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(197, 92, 17, 7),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MealProvider>(
      create: (_) => MealProvider(),
    ),
    ChangeNotifierProvider<FavrouiteMealProvider>(
      create: (_) => FavrouiteMealProvider(),
    ),
    ChangeNotifierProvider<FilterProvider>(
      create: (_) => FilterProvider(),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const Tabs());
  }
}
