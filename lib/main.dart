import 'package:flutter/material.dart';
import 'package:login_page/loginpage.dart';
import 'package:login_page/splashscreen.dart';
const SAVE_KEY_NAME='userlogin';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home:SplashScreen(),
    );
  }
}