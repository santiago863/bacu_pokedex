import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/ui/widgets/tokens/app_colors.dart';

import '../../../core/cubit/pokedex_cubit.dart';
import '../../widgets/organism/drawer_widget.dart';
import 'widgets/pokemon_card.dart';
import 'widgets/pokemon_list_appbar.dart';

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
      drawer: const DrawerWidget(),
      appBar: const PokemonListAppbar(),
      body: BlocBuilder<PokedexCubit, PokedexState>(
        builder: (context, state) {
          if (state.pokemons.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemonEntity: state.pokemons[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
