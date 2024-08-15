import 'package:flutter/material.dart';
import 'auth_services.dart'; // Import AuthServices

class WelcomeScreen extends StatelessWidget {
  final String username;

  WelcomeScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // 弹出确认对话框
              bool confirm = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Log Out'),
                      content: Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('Log Out'),
                        ),
                      ],
                    ),
                  ) ??
                  false;

              // 如果用户确认，执行注销操作
              if (confirm) {
                await AuthServices().signOut();
                Navigator.of(context)
                    .popUntil((route) => route.isFirst); // 返回到登录页面
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.orangeAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 显示从 Firebase Storage 加载的图片
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/labtest-acdfa.appspot.com/o/storage.jpg?alt=media&token=d6856c06-4650-4cb8-9f80-97608224c80b',
                height: 150, // 设置图片高度
              ),
              SizedBox(height: 20),
              Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome $username',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
