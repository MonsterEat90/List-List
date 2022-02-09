// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_list_2/constants/color_constant.dart';
import 'package:list_list_2/page/login/login_page.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  var newPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kSoftLimeGreen,
          content: Text(
            'Your Password has been Changed. Login again !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } catch (e) {}
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateUser(id, name, email, password) {
    return users
        .doc(id)
        .update({'password': password, 'confirmPassword': password})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future:
            FirebaseFirestore.instance.collection('users').doc(widget.id).get(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            print('Something Went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data!.data();
          var password = data!['password'];
          var confirmPassword = data['ConfirmPassword'];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    initialValue: password,
                    autofocus: false,
                    onChanged: (value) => password = value,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    initialValue: password,
                    autofocus: false,
                    onChanged: (value) => confirmPassword = value,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (confirmPassword != password) {
                        return "Password Don't Match!";
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        newPassword = newPasswordController.text;
                      });
                      changePassword();
                    }
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
