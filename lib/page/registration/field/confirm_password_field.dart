import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Editing Controller
final passwordEditingController = TextEditingController();
final confirmPasswordEditingController = TextEditingController();
//Confirm Password Field
final confirmPasswordField = TextFormField(
  autofocus: false,
  controller: confirmPasswordEditingController,
  obscureText: true,
  validator: (value) {
    if (confirmPasswordEditingController.text !=
        passwordEditingController.text) {
      return "Password Don't Match!";
    }
    return null;
  },
  onSaved: (value) {
    confirmPasswordEditingController.text = value!;
  },
  textInputAction: TextInputAction.done,
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.vpn_key),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Confirm Password",
    hintStyle: GoogleFonts.dongle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
