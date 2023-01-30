import 'package:flutter/material.dart';

import 'core/app.dart';
import 'core/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.setup();
  runApp(
    const App(),
  );
}
