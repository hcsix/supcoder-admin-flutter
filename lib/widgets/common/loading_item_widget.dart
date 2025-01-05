import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 加载项组件
class LoadingItemWidget extends StatelessWidget {
  const LoadingItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEBEBF4),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBF4),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 200,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFFE4E4F4),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
