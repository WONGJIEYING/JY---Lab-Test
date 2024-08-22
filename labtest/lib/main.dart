import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 引入 Firebase Core 包
import 'login_screen.dart'; // 引入自定义的登录页面

// Main entry point of the application
void main() async {
  // Ensure Flutter's engine is initialized for using async calls
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase to ensure it's ready before running the app
  await Firebase.initializeApp();

  // Launch the Flutter application
  runApp(MyApp());
}

// Define a MyApp class that extends StatelessWidget, representing the root component of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App', // Set the title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the theme color of the app
      ),
      home: LoginScreen(), // Set the initial page to load when the app starts
    );
  }
}
