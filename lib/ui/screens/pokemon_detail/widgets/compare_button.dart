import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../pokemon_compare/pokemon_compare_screen.dart';
import '../../../widgets/atoms/button_widget.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';

import '../../../../core/cubit/pokedex_cubit.dart';

class CompareButton extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const CompareButton({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      fullWidth: true,
      text: 'Compare',
      onTap: () {
        context.read<PokedexCubit>().addToCompare(
              pokemonEntity: pokemonEntity,
            );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primary,
            content: Text(
              'Has been added to compare',
              style: AppFonts.subtitle,
            ),
            action: SnackBarAction(
              label: 'View',
              textColor: AppColors.black,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  PokemonCompareScreen.route,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
