import 'package:flutter/material.dart';

import '../ui/screens/pokemon_list/pokemon_list_screen.dart';
import 'config.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokemonListScreen(),
    );
  }
}
