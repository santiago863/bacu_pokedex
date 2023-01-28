import 'package:flutter/material.dart';
import '../../widgets/atoms/pokemon_image_widget.dart';
import '../../widgets/atoms/pokemon_name_widget.dart';
import '../../widgets/atoms/pokemon_type_widget.dart';
import '../../widgets/molecules/pokemon_basic_info_widget.dart';
import '../../widgets/organism/basic_appbar.dart';
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
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
                maxHP: pokemonEntity.maxHP,
                maxCP: pokemonEntity.maxCP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
