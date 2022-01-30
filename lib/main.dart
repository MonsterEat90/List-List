// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list_list_2/constants/theme/theme_constant.dart';
import 'package:list_list_2/constants/theme/theme_manager.dart';
import 'package:list_list_2/page/home/home_page.dart';
import 'package:list_list_2/services/auth_services.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'List List',
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if (user != null) {
      return HomePage();
    }
    return LoginPage();
  }
}
