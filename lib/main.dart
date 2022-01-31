// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list_list_2/constants/color_constant.dart';
import 'package:list_list_2/constants/theme/theme_constant.dart';
import 'package:list_list_2/constants/theme/theme_manager.dart';
import 'package:list_list_2/page/user_page/account/account_page.dart';
import 'package:list_list_2/page/user_page/collection/collection_page.dart';
import 'package:list_list_2/page/user_page/home/home_page.dart';
import 'package:list_list_2/page/user_page/search/search_page.dart';
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

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  //Pages
  final pages = [
    HomePage(),
    SeacrhPage(),
    CollectionPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    //Navbar Icon
    final icons = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.collections, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: defaultColor,
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        index: index,
        height: 55,
        items: icons,
        backgroundColor: Colors.transparent,
        color: powderBlue,
        buttonBackgroundColor: blueGrey,
        onTap: (index) => setState(() => this.index = index),
      ),
      body: pages[index],
    );
  }
}
