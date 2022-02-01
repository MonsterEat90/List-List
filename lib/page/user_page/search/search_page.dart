import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final int index;
  SearchPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyan,
      child: InkWell(
        child: Center(
          child: Icon(
            Icons.security,
            color: Colors.white,
            size: index * 100.0 + 20.0,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return SearchPage(index + 1);
              },
            ),
          );
        },
      ),
    );
  }
}
