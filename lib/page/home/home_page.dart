import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_list_2/page/login/login_page.dart';

class HomePage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Logout'),
          onPressed: () {
            _auth.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );
  }
}
