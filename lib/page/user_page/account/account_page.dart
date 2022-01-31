import 'package:flutter/material.dart';
import 'package:list_list_2/constants/color_constant.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Text("account"),
      ),
    );
  }
}
