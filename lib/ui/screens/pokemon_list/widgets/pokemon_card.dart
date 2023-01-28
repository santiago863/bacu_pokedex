import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../domain/entities/pokemon_entity.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';
import '../../pokemon/pokemon_detail_screen.dart';

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
              _imageWidget(
                mediaQuery,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _nameWidget(),
                      space,
                      _typeWidget(),
                      space,
                      _basicInfoWidget(),
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

  Widget _imageWidget(
    Size mediaQuery,
  ) {
    double size = mediaQuery.width / 4;
    return ShakeWidget(
      duration: const Duration(seconds: 10),
      shakeConstant: ShakeSlowConstant1(),
      autoPlay: true,
      enableWebMouseHover: true,
      child: CachedNetworkImage(
        imageUrl: pokemonEntity.imageUrl,
        placeholder: (context, url) => const SkeletonAvatar(),
        height: size,
        width: size,
      ),
    );
  }

  Widget _nameWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        pokemonEntity.name.toUpperCase(),
        style: AppFonts.title,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _typeWidget() {
    String typeText = '';
    for (String item in pokemonEntity.types) {
      typeText += ' / $item';
    }
    typeText = typeText.substring(
      3,
      typeText.length,
    );
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        typeText.toUpperCase(),
        style: AppFonts.subtitle,
      ),
    );
  }

  Widget _basicInfoWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 3,
        bottom: 3,
        left: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '#${pokemonEntity.id}',
            style: AppFonts.subtitle,
          ),
          Text(
            'MAX HP',
            style: AppFonts.body,
          ),
          _circleText(
            AppColors.secondary,
            '${pokemonEntity.maxHP} hp',
          ),
          Text(
            'MAX CP',
            style: AppFonts.body,
          ),
          _circleText(
            AppColors.tertiary,
            'cp ${pokemonEntity.maxCP}',
          ),
        ],
      ),
    );
  }

  Widget _circleText(
    Color color,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppFonts.subtitle,
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
