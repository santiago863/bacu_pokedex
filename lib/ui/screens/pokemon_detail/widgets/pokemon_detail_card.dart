import 'package:flutter/material.dart';

import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';
import 'pokemon_detail_item.dart';

class PokemonDetailCard extends StatelessWidget {
  final String title;
  final List<PokemonDetailItem> items;
  const PokemonDetailCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.title,
            ),
            for (var item in items) item
          ],
        ),
      ),
    );
  }
}
