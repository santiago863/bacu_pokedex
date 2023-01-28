import 'package:flutter/material.dart';
import '../../../../core/config.dart';
import '../../pokemon_search/pokemon_search_screen.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';

class PokemonListAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PokemonListAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      centerTitle: true,
      title: Text(
        Config.appName,
        style: AppFonts.title.copyWith(
          color: AppColors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).pushNamed(
            PokemonSearchScreen.route,
          ),
          icon: const Icon(
            Icons.search,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
