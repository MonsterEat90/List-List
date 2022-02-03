import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';

class AddCollection extends StatelessWidget {
  const AddCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Collection",
          style: GoogleFonts.dongle(
            fontSize: 40,
            color: sapphireBlue,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: sapphireBlue,
          ),
          onPressed: () {
            //passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
