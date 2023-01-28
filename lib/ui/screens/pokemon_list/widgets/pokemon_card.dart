import 'package:flutter/material.dart';
import '../../../widgets/molecules/pokemon_basic_info_widget.dart';
import '../../../widgets/atoms/pokemon_image_widget.dart';
import '../../../widgets/atoms/pokemon_name_widget.dart';
import '../../../widgets/atoms/pokemon_type_widget.dart';

import '../../../../domain/entities/pokemon_entity.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';
import '../../pokemon_detail/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const PokemonCard({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    const space = SizedBox(
      height: 8,
    );
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        PokemonDetailScreen.route,
        arguments: pokemonEntity,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              PokemonImageWidget(
                url: pokemonEntity.imageUrl,
                mediaQuery: mediaQuery,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      PokemonNameWidget(
                        name: pokemonEntity.name,
                      ),
                      space,
                      PokemonTypeWidget(
                        types: pokemonEntity.types,
                      ),
                      space,
                      PokemonBasicInfoWidget(
                        id: pokemonEntity.id,
                        maxHP: pokemonEntity.maxHP,
                        maxCP: pokemonEntity.maxCP,
                      ),
                      space,
                      _extraInfoWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _extraInfoWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _extraInfoItem(
              'Height:',
              '~ ${(pokemonEntity.height * .1).toStringAsFixed(1)} m',
            ),
            _extraInfoItem(
              'Weight',
              '~ ${(pokemonEntity.weight * .1).toStringAsFixed(1)} kg',
            ),
          ],
        ),
        Expanded(
          child: Container(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _extraInfoItem(
              'Generation:',
              pokemonEntity.generation.toString(),
            ),
            _extraInfoItem(
              'Candy:',
              pokemonEntity.candy.toString(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _extraInfoItem(
    String title,
    String value,
  ) {
    return Row(
      children: [
        Text(
          title,
          style: AppFonts.body,
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: AppFonts.subtitle,
        ),
      ],
    );
  }
}
