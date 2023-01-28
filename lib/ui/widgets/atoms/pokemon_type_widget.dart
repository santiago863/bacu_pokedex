import 'package:flutter/material.dart';

import '../tokens/app_fonts.dart';

class PokemonTypeWidget extends StatelessWidget {
  final List<dynamic> types;
  const PokemonTypeWidget({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    String typeText = '';
    for (String item in types) {
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
}
