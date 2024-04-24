import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: MaterialStatePropertyAll(Colors.teal),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ),
  ),
);
