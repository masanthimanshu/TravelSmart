import 'package:flutter/material.dart';

import '/view/home/home_screen.dart';
import '/view/location/edit_location.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (e) => const HomeScreen(),
  "/add": (e) => const EditLocation(),
};
