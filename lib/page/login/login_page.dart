// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';
import 'package:list_list_2/page/home/home_page.dart';
import 'package:list_list_2/page/registration/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  //Editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //Firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                    gradient: LinearGradient(
                      colors: [chetwodeBlue, blueGrey],
                      stops: [0.0, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 160,
                        height: 160,
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                          fit: BoxFit.contain,
                          color: whiteColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        alignment: Alignment.topRight,
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.dongle(
                            textStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      // Email Field
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                                offset: Offset(5.0, 5.0),
                              ),
                            ]),
                        child: TextFormField(
                          autofocus: false,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            setState(() {
                              emailController.text = value!.trim();
                            });
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintStyle: GoogleFonts.dongle(fontSize: 30),
                              icon: Icon(Icons.email),
                              hintText: 'Email',
                              border: InputBorder.none),
                        ),
                      ),
                      // Password Field
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(50.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          obscureText: _isObscure,
                          enableSuggestions: false,
                          autofocus: false,
                          autocorrect: false,
                          controller: passwordController,
                          validator: (value) {
                            setState(() {
                              passwordController.text = value!.trim();
                            });
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                            ),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.dongle(fontSize: 30),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      // Forgot Password
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print("its tapped");
                          },
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // Login Button
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
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
                                  "Login",
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
                                  _auth
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((_) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
          )
        ],
      ),
    );
  }
}
