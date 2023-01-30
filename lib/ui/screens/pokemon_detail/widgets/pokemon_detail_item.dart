import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/string_extension.dart';
import '../../../widgets/tokens/app_fonts.dart';

class PokemonDetailItem extends StatelessWidget {
  final String title;
  final String value;
  const PokemonDetailItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    const double fontSize = 18;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppFonts.body.copyWith(
              fontSize: fontSize,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            value.toUnPath(),
            maxLines: 5,
            style: AppFonts.subtitle.copyWith(
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
