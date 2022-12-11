import 'package:as_one/app/app.dart';
import 'package:flutter/material.dart';
import 'app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init("");
  runApp(const MyApp());
}
