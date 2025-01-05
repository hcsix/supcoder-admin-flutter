import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../widgets/common/native_item_widget.dart';

class TestScreen extends StatefulWidget {
  TestScreen({required this.title}) : super();

  final String title;

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<String> feedList = [
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY1',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY2',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY3',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY4',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY5',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY6',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY7',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY8',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY9',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY10',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY11',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY12',
    'https://www.youtube.com/watch?v=_Uu1_Zz3XzY13'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: NativeItemWidget(id: index)
                );
              },
              childCount: feedList.length,
            ),
          )
        ],
      ),
    );
  }
}
