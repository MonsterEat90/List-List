// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:list_list_2/constants/color_constant.dart';
import 'package:list_list_2/page/user_page/account/account_page.dart';
import 'package:list_list_2/page/user_page/auction/auction_page.dart';
import 'package:list_list_2/page/user_page/collection/collection_page.dart';
import 'package:list_list_2/page/user_page/home/home_page.dart';
import 'package:list_list_2/page/user_page/search/search_page.dart';

class PageNavbar extends StatefulWidget {
  const PageNavbar({Key? key}) : super(key: key);

  @override
  State<PageNavbar> createState() => _PageNavbarState();
}

class _PageNavbarState extends State<PageNavbar> {
  int _pages = 0;

  List<Widget> initialWidgets = <Widget>[
    HomePage(1),
    SearchPage(2),
    AuctionPage(3),
    CollectionPage(4),
    AccountPage(5),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: powderBlue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            backgroundColor: defaultColor,
            bottomNavigationBar: CurvedNavigationBar(
              items: <Widget>[
                Icon(Icons.home, size: 30),
                FaIcon(FontAwesomeIcons.search, size: 30),
                FaIcon(FontAwesomeIcons.gavel, size: 30),
                Icon(Icons.collections, size: 30),
                FaIcon(FontAwesomeIcons.solidUser, size: 30),
              ],
              height: 55,
              index: _pages,
              backgroundColor: Colors.transparent,
              color: powderBlue,
              buttonBackgroundColor: blueGrey,
              onTap: (int index) {
                setState(() {
                  _pages = index;
                });
              },
            ),
            body: Stack(
              children: List<Widget>.generate(
                initialWidgets.length,
                (int index) {
                  return IgnorePointer(
                    ignoring: index != _pages,
                    child: Opacity(
                      opacity: _pages == index ? 1.0 : 0.0,
                      child: Navigator(
                        onGenerateRoute: (RouteSettings settings) {
                          return MaterialPageRoute(
                            builder: (_) => initialWidgets[index],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
