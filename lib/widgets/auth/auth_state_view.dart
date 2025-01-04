import 'package:flutter/material.dart';
import 'package:supcoder/screens/auth/login_screen.dart';

class AuthStateView extends StatelessWidget {
  final bool isLoggedIn;
  final Widget? child;

  AuthStateView({required this.isLoggedIn, this.child});

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? child ?? Container() // 如果已登录，显示传入的子布局，如果没有传入子布局则显示空容器
        : ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('登录'),
          );
  }
}
