import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supcoder/screens/role/role_manage_screen.dart';
import 'package:supcoder/screens/user/user_manage_screen.dart';

import 'auth/login_screen.dart';
import 'index/index_screen.dart';
import 'mine/mine_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isTapped = false; // 用于防抖

  static const List<String> _tabLabels = [
    '首页',
    '用户管理',
    '角色管理',
    '我的',
  ];

  static const List<IconData> _tabIcons = [
    Icons.home,
    Icons.people,
    Icons.supervised_user_circle,
    Icons.person,
  ];

  final List<Widget> _pages = [
    IndexScreen(),
    UserManageScreen(),
    RoleManageScreen(),
    MineScreen(),
  ];

  void _onTabTapped(int index) {
    if (_isTapped || index == _currentIndex) return;
    _isTapped = true;
    Future.delayed(const Duration(milliseconds: 300), () {
      _isTapped = false;
    });
    setState(() {
      if (index >= 0 && index < _pages.length) {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary ?? Colors.blue,
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Theme.of(context).colorScheme.primary, // 设置背景颜色
        items: List.generate(_tabLabels.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(_tabIcons[index]),
            label: _tabLabels[index],
          );
        }),
      ),
    );
  }
}
