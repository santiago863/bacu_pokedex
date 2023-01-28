import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_fonts.dart';

class PokemonBasicInfoWidget extends StatelessWidget {
  final int id;
  final int maxHP;
  final int maxCP;
  const PokemonBasicInfoWidget({
    super.key,
    required this.id,
    required this.maxHP,
    required this.maxCP,
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
            style: AppFonts.subtitle,
          ),
          Text(
            'MAX HP',
            style: AppFonts.body,
          ),
          _circleText(
            AppColors.secondary,
            '$maxHP hp',
          ),
          Text(
            'MAX CP',
            style: AppFonts.body,
          ),
          _circleText(
            AppColors.tertiary,
            'cp $maxCP',
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
}
