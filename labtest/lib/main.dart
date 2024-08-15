import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 引入 Firebase Core 包
import 'login_screen.dart'; // 引入自定义的登录页面

// 应用的主入口函数
void main() async {
  // 确保 Flutter 的引擎已经初始化，以便使用异步调用
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 Firebase，确保在运行应用前 Firebase 已经初始化完毕
  await Firebase.initializeApp();

  // 启动 Flutter 应用
  runApp(MyApp());
}

// 定义一个 MyApp 类，继承自 StatelessWidget，表示应用的根组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App', // 设置应用的标题
      theme: ThemeData(
        primarySwatch: Colors.blue, // 设置应用的主题颜色
      ),
      home: LoginScreen(), // 设置应用启动时加载的初始页面
    );
  }
}
