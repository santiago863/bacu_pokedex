import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubit/pokedex_cubit.dart';
import 'widgets/no_pokemons_search_widget.dart';
import 'widgets/no_search_widget.dart';
import 'widgets/pokemon_search_card.dart';
import 'widgets/search_appbar.dart';

class PokemonSearchScreen extends StatelessWidget {
  static const String route = '/pokemon-search';
  const PokemonSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const SearchAppbar(),
          body: SingleChildScrollView(
            child: state.query.length < 2
                ? const NoSearchWidget()
                : state.pokemonsSearch.isEmpty
                    ? const NoPokemonsSearchWidget()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.pokemonsSearch.length,
                        itemBuilder: (context, index) {
                          return PokemonSearchCard(
                            pokemonEntity: state.pokemonsSearch[index],
                          );
                        },
                      ),
          ),
        );
      },
    );
  }
}
