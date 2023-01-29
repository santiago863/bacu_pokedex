import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/pokemon_detail/widgets/pokemon_detail_card.dart';
import 'package:pokedex/ui/screens/pokemon_detail/widgets/pokemon_detail_item.dart';
import 'package:pokedex/ui/widgets/tokens/app_fonts.dart';
import 'package:pokedex/utils/extensions/list_extensions.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';

import '../../../domain/entities/pokemon_entity.dart';
import '../../widgets/atoms/pokemon_image_widget.dart';
import '../../widgets/atoms/pokemon_name_widget.dart';
import '../../widgets/atoms/pokemon_type_widget.dart';
import '../../widgets/molecules/pokemon_basic_info_widget.dart';
import '../../widgets/organism/basic_appbar.dart';
import '../../widgets/tokens/app_colors.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const String route = '/pokemon-detail';
  final PokemonEntity pokemonEntity;
  const PokemonDetailScreen({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: BasicAppbar(
        title: pokemonEntity.name,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              PokemonNameWidget(
                name: pokemonEntity.name,
                fontSize: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  PokemonImageWidget(
                    url: pokemonEntity.imageUrl,
                    mediaQuery: mediaQuery,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        PokemonTypeWidget(
                          types: pokemonEntity.types,
                          fontSize: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          pokemonEntity.description!,
                          style: AppFonts.body.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              PokemonBasicInfoWidget(
                id: pokemonEntity.id,
                maxHP: pokemonEntity.stamina,
                maxCP: pokemonEntity.maxAttack,
                fontSize: 15,
              ),
              _basicInfo(),
              _stats(),
              _list(),
              _extraInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _basicInfo() {
    return PokemonDetailCard(
      title: 'Basic Info',
      items: [
        PokemonDetailItem(
          title: 'Generation:',
          value: pokemonEntity.generation!.split('-')[1].toUpperCase(),
        ),
        PokemonDetailItem(
          title: 'Region:',
          value: pokemonEntity.region!,
        ),
        PokemonDetailItem(
          title: 'Height',
          value: '~ ${(pokemonEntity.height * .1).toStringAsFixed(1)} m',
        ),
        PokemonDetailItem(
          title: 'Weight',
          value: '~ ${(pokemonEntity.weight * .1).toStringAsFixed(1)} kg',
        ),
      ],
    );
  }

  Widget _stats() {
    return PokemonDetailCard(
      title: 'Stats',
      items: [
        PokemonDetailItem(
          title: 'Stamina:',
          value: pokemonEntity.stamina.toString(),
        ),
        PokemonDetailItem(
          title: 'Attack:',
          value: pokemonEntity.attack.toString(),
        ),
        PokemonDetailItem(
          title: 'Defence:',
          value: pokemonEntity.defence.toString(),
        ),
        PokemonDetailItem(
          title: 'Max Attack:',
          value: pokemonEntity.maxAttack.toString(),
        ),
        PokemonDetailItem(
          title: 'Max Defence:',
          value: pokemonEntity.maxDefence.toString(),
        ),
        PokemonDetailItem(
          title: 'Speed:',
          value: pokemonEntity.speed.toString(),
        ),
      ],
    );
  }

  Widget _list() {
    return PokemonDetailCard(
      title: 'List',
      items: [
        PokemonDetailItem(
          title: 'Types:',
          value: pokemonEntity.types.toListItems(),
        ),
        PokemonDetailItem(
          title: 'Moves:',
          value: pokemonEntity.moves.toListItems(),
        ),
        PokemonDetailItem(
          title: 'Evolves:',
          value: pokemonEntity.evolves!.toListItems(),
        ),
      ],
    );
  }

  Widget _extraInfo() {
    return PokemonDetailCard(
      title: 'Extra Info',
      items: [
        PokemonDetailItem(
          title: 'Color:',
          value: pokemonEntity.color.toString(),
        ),
        PokemonDetailItem(
          title: 'Capture Rate:',
          value: '${pokemonEntity.captureRate.toString()}%',
        ),
        PokemonDetailItem(
          title: 'Found In:',
          value: pokemonEntity.foundIn!,
        ),
        PokemonDetailItem(
          title: 'Shape:',
          value: pokemonEntity.shape!,
        ),
        PokemonDetailItem(
          title: 'Baby:',
          value: pokemonEntity.baby!.toString(),
        ),
      ],
    );
  }
}
