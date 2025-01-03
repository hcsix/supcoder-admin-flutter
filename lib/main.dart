import 'package:flutter/material.dart';
import 'package:supcoder/screens/home_screen.dart';
import 'package:supcoder/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const HomeScreen(title: 'SUP CODER'),
    );
  }
}
