
import 'package:flutter/material.dart';
import 'package:itogovaya_rabota/global_theme.dart';
import 'package:itogovaya_rabota/screens/app_about.dart';
import 'package:itogovaya_rabota/screens/login.dart';
import 'package:itogovaya_rabota/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/about': (context) => const App(),
        '/home': (context) => const UmbrellaApp(),
        '/login': (context) => const Login(),
      },
      title: 'Дипломная работа',
      theme: globalTheme(),
      home: const Login(),
    );
  }
}

