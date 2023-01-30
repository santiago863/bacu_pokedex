import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_fonts.dart';

class PokemonBasicInfoWidget extends StatelessWidget {
  final int id;
  final int maxHP;
  final int maxCP;
  final double? fontSize;
  const PokemonBasicInfoWidget({
    super.key,
    required this.id,
    required this.maxHP,
    required this.maxCP,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
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
            '#$id',
            style: AppFonts.subtitle.copyWith(
              fontSize: fontSize,
            ),
          ),
          Text(
            'MAX HP',
            style: AppFonts.body.copyWith(
              fontSize: fontSize,
            ),
          ),
          _circleText(
            color: AppColors.secondary,
            text: '$maxHP hp',
          ),
          Text(
            'MAX CP',
            style: AppFonts.body.copyWith(
              fontSize: fontSize,
            ),
          ),
          _circleText(
            color: AppColors.tertiary,
            text: 'cp $maxCP',
          ),
        ],
      ),
    );
  }

  Widget _circleText({
    required Color color,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppFonts.subtitle.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
