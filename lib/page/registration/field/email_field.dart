import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Editing Controller
final emailEditingController = TextEditingController();
//Email Field
final emailField = TextFormField(
  autofocus: false,
  controller: emailEditingController,
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value!.isEmpty) {
      return ("Please Enter Your Email!");
    }
    //reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please Enter a Valid Email!");
    }
    return null;
  },
  onSaved: (value) {
    emailEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.mail),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Email",
    hintStyle: GoogleFonts.dongle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
