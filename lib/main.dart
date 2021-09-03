import 'package:flutter/material.dart';
import 'presentation/app.dart';
import 'core/di/injectable.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}
