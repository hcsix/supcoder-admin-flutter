import 'package:flutter/material.dart';

import '../../widgets/auth/auth_state_view.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AuthStateView(
          isLoggedIn: false, // 根据实际情况设置为 true 或 false
          child: Text('首页'), // 可选的子布局
        ),
      ),
    );
  }
}
