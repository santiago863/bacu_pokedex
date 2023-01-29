import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/no_pokemons_widget.dart';
import 'widgets/pokemon_compare_card.dart';
import '../../widgets/organism/basic_appbar.dart';

import '../../../core/cubit/pokedex_cubit.dart';

class PokemonCompareScreen extends StatelessWidget {
  static const String route = '/pokemon-compare';
  const PokemonCompareScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: 'Compare Pokemons',
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PokedexCubit, PokedexState>(
          builder: (context, state) {
            if (state.pokemonsCompare.isEmpty) {
              return const NoPokemonsWidget();
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.pokemonsCompare.length,
                itemBuilder: (context, index) {
                  return PokemonCompareCard(
                    pokemonEntity: state.pokemonsCompare[index],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
