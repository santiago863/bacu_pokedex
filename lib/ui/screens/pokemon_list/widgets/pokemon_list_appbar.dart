import 'package:flutter/material.dart';
import 'package:pokedex/core/config.dart';
import 'package:pokedex/ui/widgets/tokens/app_colors.dart';
import 'package:pokedex/ui/widgets/tokens/app_fonts.dart';

class PokemonListAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PokemonListAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: Text(
        Config.appName,
        style: AppFonts.title.copyWith(
          color: AppColors.black,
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: AppColors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
