import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screen/categories_screen.dart';
import 'package:meal_app/screen/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(197, 92, 17, 7),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: Tabs());
  }
}