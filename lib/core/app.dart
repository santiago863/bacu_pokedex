import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokedex_cubit.dart';

import '../ui/screens/pokemon_list/pokemon_list_screen.dart';
import 'config.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokedexCubit()..fetchPokedex(),
      child: MaterialApp(
        title: Config.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PokemonListScreen(),
      ),
    );
  }
}
