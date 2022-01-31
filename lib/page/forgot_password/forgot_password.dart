// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';
import 'package:list_list_2/page/registration/registration_page.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  final emailController = TextEditingController();

  @override
  void dispose() {
    //Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  //Resetting Password
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: powderBlue,
        content: Text(
          'Password Reset Email has been sent',
          style: GoogleFonts.dongle(fontSize: 20),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found with that email');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: powderBlue,
            content: Text(
              'No user found with that email',
              style: GoogleFonts.dongle(fontSize: 20),
            ),
          ),
        );
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Reset Link will be sent to your email',
              style: GoogleFonts.dongle(fontSize: 25),
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        autofocus: false,
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.dongle(fontSize: 20),
                          border: const OutlineInputBorder(),
                          errorStyle: GoogleFonts.dongle(
                            color: redColor,
                            fontSize: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [chetwodeBlue, blueGrey],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          child: Center(
                            child: MaterialButton(
                              child: Text(
                                "Send Email",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dongle(
                                  fontSize: 28,
                                  color: defaultColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () {
                                // Validate returns true if the form is valid, otherwise false.
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                  });
                                  resetPassword();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                              color: chetwodeBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
