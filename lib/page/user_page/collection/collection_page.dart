import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Scaffold(
      backgroundColor: defaultColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightRedColor,
        child: const FaIcon(FontAwesomeIcons.plus),
        onPressed: () {
          print("add button pressed");
        },
      ),
    );
  }
}
