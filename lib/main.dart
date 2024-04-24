import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_smart/utils/routes.dart';
import 'package:travel_smart/utils/theme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("myBox");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: appTheme, routes: appRoutes);
  }
}
