import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';

class CollectionPage extends StatefulWidget {
  final int index;
  CollectionPage(this.index);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: defaultColor,
        appBar: AppBar(
          backgroundColor: kModerateCyan,
          title: Text(
            "My Collection",
            style: GoogleFonts.dongle(
              fontSize: 45,
              color: whiteColor,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 3,
          backgroundColor: lightRedColor,
          child: const FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
            print("add button pressed");
          },
        ),
      ),
    );
  }
}
