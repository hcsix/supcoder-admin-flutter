import 'package:flutter/material.dart';
import 'package:supcoder/screens/auth/login_screen.dart';
import 'package:supcoder/screens/home_screen.dart';
import 'package:supcoder/screens/mine/about_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(title: 'SUP CODER'),
        '/login': (context) => LoginScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
