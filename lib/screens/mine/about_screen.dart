// about_page.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
        backgroundColor: Colors.blue, // 根据需要调整颜色
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 标题
              Text(
                'SupCoder',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // 根据需要调整颜色
                ),
              ),
              SizedBox(height: 16.0),

              // 子标题
              Text(
                '您的编程助手',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 32.0),

              // 关于我们内容
              Text(
                'SupCoder 是一个致力于帮助开发者提高编程效率的工具。我们提供各种功能，包括代码生成、代码解释、异常排查等，旨在让编程变得更加简单和高效。',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16.0),

              // 团队介绍
              Text(
                '我们的团队',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // 根据需要调整颜色
                ),
              ),
              SizedBox(height: 16.0),

              // 团队成员
              _buildTeamMember(
                name: '张三',
                role: '创始人 & CEO',
                description: '拥有超过10年的软件开发经验，专注于技术创新。',
              ),
              _buildTeamMember(
                name: '李四',
                role: '技术总监',
                description: '负责技术架构和团队管理，确保项目顺利进行。',
              ),
              _buildTeamMember(
                name: '王五',
                role: '开发工程师',
                description: '专注于前端开发，致力于提供最佳用户体验。',
              ),
              SizedBox(height: 32.0),

              // 联系我们
              Text(
                '联系我们',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // 根据需要调整颜色
                ),
              ),
              SizedBox(height: 16.0),

              // 联系方式
              Row(
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text(
                    'support@supcoder.com',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text(
                    '+123 456 7890',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text(
                    '1234 编程路, 开发市, 技术省',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue, // 根据需要调整颜色
          ),
        ),
        Text(
          role,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
