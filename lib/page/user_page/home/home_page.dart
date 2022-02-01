import 'package:flutter/material.dart';
import 'package:list_list_2/constants/color_constant.dart';

class HomePage extends StatelessWidget {
  final int index;
  HomePage(this.index);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: defaultColor,
      child: InkWell(
        child: Center(
          child: Icon(
            Icons.security,
            color: Colors.orange,
            size: index * 100.0 + 20.0,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePage(index + 1);
              },
            ),
          );
        },
      ),
    );
  }
}
