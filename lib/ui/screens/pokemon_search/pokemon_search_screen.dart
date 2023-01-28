import 'package:flutter/material.dart';
import 'widgets/search_appbar.dart';

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
