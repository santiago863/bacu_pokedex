import 'package:flutter/material.dart';

import '../tokens/app_fonts.dart';

class PokemonNameWidget extends StatelessWidget {
  final String name;
  const PokemonNameWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        name.toUpperCase(),
        style: AppFonts.title,
        textAlign: TextAlign.left,
      ),
    );
  }
}
