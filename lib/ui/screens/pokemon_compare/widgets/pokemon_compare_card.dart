import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/pokedex_cubit.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../widgets/atoms/pokemon_image_widget.dart';
import '../../../widgets/molecules/pokemon_basic_info_widget.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';

class PokemonCompareCard extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const PokemonCompareCard({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      pokemonEntity.name,
                      style: AppFonts.title,
                    ),
                    PokemonImageWidget(
                      url: pokemonEntity.imageUrl,
                      mediaQuery: MediaQuery.of(context).size,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              pokemonEntity.description!,
                              style: AppFonts.body.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<PokedexCubit>().removeToCompare(
                                    pokemonEntity: pokemonEntity,
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.primary,
                                  content: Text(
                                    'Pokemon removed from compare',
                                    style: AppFonts.subtitle,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PokemonBasicInfoWidget(
                        id: pokemonEntity.id,
                        maxHP: pokemonEntity.stamina,
                        maxCP: pokemonEntity.maxAttack,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
