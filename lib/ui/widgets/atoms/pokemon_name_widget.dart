import 'package:flutter/material.dart';

import '../tokens/app_fonts.dart';

class PokemonNameWidget extends StatelessWidget {
  final String name;
  final double? fontSize;
  const PokemonNameWidget({
    super.key,
    required this.name,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.left,
        style: AppFonts.title.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
