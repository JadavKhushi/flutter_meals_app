import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';
// import 'package:mealsapp/asset/fonts/';

final theme = ThemeData(
    fontFamily: 'Raleway',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromRGBO(131, 57, 0, 1),
    ));

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
