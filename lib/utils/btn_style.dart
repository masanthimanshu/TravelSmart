import 'package:flutter/material.dart';

final actionButtonStyle = ButtonStyle(
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  iconSize: const MaterialStatePropertyAll(30),
  iconColor: const MaterialStatePropertyAll(Colors.white),
  padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
  backgroundColor: const MaterialStatePropertyAll(Colors.teal),
);
