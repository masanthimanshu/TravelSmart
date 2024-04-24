import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _hiveBox = Hive.box("myBox");
final List<String> _default = _hiveBox.get("cities") ?? ["Noida", "Gurugram"];

final cityNamesProvider = StateProvider<List<String>>((ref) => _default);
