// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';
import 'package:list_list_2/page/login/login_page.dart';
import 'package:list_list_2/page/user_page/home/chat_page.dart';

class HomePage extends StatefulWidget {
  final int index;
  HomePage(this.index);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  Future<void> onRefresh() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: Text(
            'List List',
            style: GoogleFonts.dongle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
              color: whiteColor,
            ),
          ),
          onPressed: () {
            print("its pressed");
          },
        ),
        backgroundColor: kModerateCyan,
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.solidComments, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: FlatButton(
            child: Text('Logout'),
            onPressed: () {
              _auth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ),
      ),
    );
  }
}
