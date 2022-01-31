// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  //Navbar Icon
  final pages = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.collections, size: 30),
    Icon(Icons.person, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: defaultColor,
      appBar: AppBar(
        title: Text("List List"),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        height: 55,
        items: pages,
        backgroundColor: Colors.transparent,
        color: powderBlue,
        buttonBackgroundColor: blueGrey,
        onTap: (index) => setState(() => this.index = index),
      ),
      body: Center(
        child: Text(
          '$index',
          style: GoogleFonts.dongle(
            fontSize: 125,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
