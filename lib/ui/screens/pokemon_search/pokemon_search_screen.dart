import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/pokemon_search/widgets/search_appbar.dart';

class PokemonSearchScreen extends StatelessWidget {
  static const String route = '/pokemon-search';
  const PokemonSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppbar(
        onTap: (searchText) {},
      ),
    );
  }
}
