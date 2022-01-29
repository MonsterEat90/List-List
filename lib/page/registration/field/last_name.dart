import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Editing Controller
final lastNameEditingController = TextEditingController();
//Last Name Field
final lastNameField = TextFormField(
  autofocus: false,
  controller: lastNameEditingController,
  keyboardType: TextInputType.name,
  validator: (value) {
    RegExp regex = RegExp(r'^,{3,}$');
    if (value!.isEmpty) {
      return ("Last Name Cannot be Empty!");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter a Valid Name! (Min. 3 Character)");
    }
    return null;
  },
  onSaved: (value) {
    lastNameEditingController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.account_circle),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Last Name",
    hintStyle: GoogleFonts.dongle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
