import 'package:flutter/material.dart';
import '../../../domain/entities/pokemon_entity.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const String route = '/pokemon-detail';
  final PokemonEntity pokemonEntity;
  const PokemonDetailScreen({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
