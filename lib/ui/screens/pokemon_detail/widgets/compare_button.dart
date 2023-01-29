import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/ui/screens/pokemon_compare/pokemon_compare_screen.dart';
import 'package:pokedex/ui/widgets/tokens/app_colors.dart';
import 'package:pokedex/ui/widgets/tokens/app_fonts.dart';

class CompareButton extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const CompareButton({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          PokemonCompareScreen.route,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Text(
          'Compare',
          style: AppFonts.subtitle.copyWith(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
