// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list_list_2/constants/theme/theme_constant.dart';
import 'package:list_list_2/constants/theme/theme_manager.dart';
import 'page/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List List',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: LoginPage(),
    );
  }
}
