import 'package:flutter/material.dart';
import '../../pokemon_detail/pokemon_detail_screen.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../../widgets/atoms/pokemon_image_widget.dart';
import '../../../widgets/molecules/pokemon_basic_info_widget.dart';
import '../../../widgets/tokens/app_fonts.dart';

class PokemonSearchCard extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const PokemonSearchCard({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          PokemonDetailScreen.route,
          arguments: pokemonEntity,
        );
      },
      child: Card(
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
      ),
    );
  }
}
