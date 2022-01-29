import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Editing Controller
final passwordEditingController = TextEditingController();
//Password Field
final passwordField = TextFormField(
  autofocus: false,
  controller: passwordEditingController,
  obscureText: true,
  validator: (value) {
    RegExp regExp = RegExp(r'^,{6,}$');
    if (value!.isEmpty) {
      return ("Password is Required for Login!");
    }
    if (!regExp.hasMatch(value)) {
      return ("Please Enter a Valid Password (Min. 6 Character)");
    }
  },
  onSaved: (value) {
    passwordEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.vpn_key),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Password",
    hintStyle: GoogleFonts.dongle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
