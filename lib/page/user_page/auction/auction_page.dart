import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';

class AuctionPage extends StatelessWidget {
  final int index;
  AuctionPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(
        backgroundColor: kModerateCyan,
        title: Text(
          "Auction",
          style: GoogleFonts.dongle(
            fontSize: 45,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
