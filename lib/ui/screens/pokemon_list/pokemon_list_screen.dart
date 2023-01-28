import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/pokedex_cubit.dart';
import 'widgets/pokemon_card.dart';

class PokemonListScreen extends StatefulWidget {
  static const String route = '/pokemon-list';
  const PokemonListScreen({
    super.key,
  });

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokedexCubit, PokedexState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.pokemons.length,
            itemBuilder: (context, index) {
              return PokemonCard(
                pokemonEntity: state.pokemons[index],
              );
            },
          );
        },
      ),
    );
  }
}
