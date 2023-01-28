import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/ui/widgets/tokens/app_fonts.dart';
import 'package:skeletons/skeletons.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const PokemonCard({
    super.key,
    required this.pokemonEntity,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _imageWidget(
            mediaQuery,
          ),
          Column(
            children: [
              _nameWidget(),
              _typeWidget(),
              _basicInfoWidget(),
              _extraInfoWidget(),
            ],
          ),
        ],
      ),
    );
  }

  _imageWidget(
    Size mediaQuery,
  ) {
    double size = mediaQuery.width / 3;
    return CachedNetworkImage(
      imageUrl: pokemonEntity.imageUrl,
      placeholder: (context, url) => const SkeletonAvatar(),
      height: size,
      width: size,
    );
  }

  _nameWidget() {
    return Text(
      pokemonEntity.name,
      style: AppFonts.title,
    );
  }

  _typeWidget() {
    String typeText = pokemonEntity.types[0];
    return Text(
      typeText,
      style: AppFonts.subtitle,
    );
  }

  _basicInfoWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          pokemonEntity.id.toString(),
          style: AppFonts.body,
        ),
        Text(
          pokemonEntity.id.toString(),
        ),
        Text(
          pokemonEntity.id.toString(),
        ),
        Text(
          pokemonEntity.id.toString(),
        ),
        Text(
          pokemonEntity.id.toString(),
        ),
      ],
    );
  }

  // _basicInfoItem(
  //   String title,
  //   int value,
  // ) {
  //   Expanded(
  //     child: Row(
  //       children: [
  //         Text(
  //           title,
  //         ),
  //         // Text(
  //         //   value.toString(),
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  _extraInfoWidget() {
    return Column(
      children: [
        Row(
          children: const [
            Text('data'),
            Text('data'),
          ],
        ),
        Row(
          children: const [
            Text('data'),
            Text('data'),
          ],
        ),
      ],
    );
  }
}
