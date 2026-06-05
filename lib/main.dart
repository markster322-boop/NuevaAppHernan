import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MilitaryBandApp());
}

class MilitaryBandApp extends StatelessWidget {
  const MilitaryBandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca de Banda Militar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B3A57),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
