import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Editing Controller
final firstNameEditingController = TextEditingController();
//First Name Field
final firstNameField = TextFormField(
  autofocus: false,
  controller: firstNameEditingController,
  keyboardType: TextInputType.name,
  validator: (value) {
    RegExp regExp = RegExp(r'^,{3,}$');
    if (value!.isEmpty) {
      return ("Fisrt Name Cannot be Empty!");
    }
    if (!regExp.hasMatch(value)) {
      return ("Enter a Valid Name! (Min. 3 Character)");
    }
    return null;
  },
  onSaved: (value) {
    firstNameEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.account_circle),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Fisrt Name",
    hintStyle: GoogleFonts.dongle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
