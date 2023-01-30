import 'package:flutter/material.dart';

import '../domain/entities/pokemon_entity.dart';
import '../ui/screens/pokemon_compare/pokemon_compare_screen.dart';
import '../ui/screens/pokemon_detail/pokemon_detail_screen.dart';
import '../ui/screens/pokemon_list/pokemon_list_screen.dart';
import '../ui/screens/pokemon_search/pokemon_search_screen.dart';

abstract class Routes {
  static const String initialRoute = PokemonListScreen.route;
  static final Map<String, Widget Function(BuildContext)> allRoutes = {
    PokemonListScreen.route: (context) {
      return const PokemonListScreen();
    },
    PokemonDetailScreen.route: (context) {
      final pokemonEntity =
          ModalRoute.of(context)!.settings.arguments as PokemonEntity;
      return PokemonDetailScreen(
        pokemonEntity: pokemonEntity,
      );
    },
    PokemonSearchScreen.route: (context) {
      return const PokemonSearchScreen();
    },
    PokemonCompareScreen.route: (context) {
      return const PokemonCompareScreen();
    },
  };
}
