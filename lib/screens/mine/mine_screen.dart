import 'dart:ui';

import 'package:flutter/material.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});

  @override
  MineScreenState createState() {
    return MineScreenState();
  }
}

class MineScreenState extends State<MineScreen> {
  final String name = '张三';
  final String bio = 'Flutter 开发者，热爱编程和旅行。';
  final String email = 'zhangsan@example.com';
  final String phone = '123-456-7890';
  final String avatarUrl = 'https://via.placeholder.com/150'; // 使用占位图

  final double actionBarHeight = 48;
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(children: <Widget>[
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                setState(() {
                  _scrollOffset = notification.metrics.pixels;
                });
                return true;
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top +
                        actionBarHeight +
                        20),
                // 添加 SingleChildScrollView
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 88,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(avatarUrl),
                            ))
                      ]),
                    ),
                    SizedBox(height: 20),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      bio,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(email),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(phone),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).padding.top + actionBarHeight,
              child: Opacity(
                opacity: (_scrollOffset / 150).clamp(0.0, 1.0),
                child: Container(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.blue.shade900,
                        Colors.blue.shade600,
                      ])),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                right: 0,
                height: actionBarHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.message_rounded),
                        onPressed: () {},
                      ),
                    ]))
          ])),
    );
  }
}
