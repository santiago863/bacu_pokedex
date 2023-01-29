import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/pokedex_cubit.dart';
import '../../pokemon_compare/pokemon_compare_screen.dart';
import '../../../../core/config.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';
import 'package:badges/badges.dart' as badges;

import '../../pokemon_search/pokemon_search_screen.dart';

class PokemonListAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PokemonListAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexState>(
      builder: (context, state) {
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
                PokemonCompareScreen.route,
              ),
              icon: badges.Badge(
                position: badges.BadgePosition.custom(
                  top: -12,
                  end: -12,
                ),
                badgeStyle: const BadgeStyle(
                  badgeColor: AppColors.tertiary,
                ),
                badgeContent: Text(
                  state.pokemonsCompare.length.toString(),
                ),
                child: const Icon(
                  Icons.compare,
                  color: AppColors.black,
                ),
              ),
            ),
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
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
