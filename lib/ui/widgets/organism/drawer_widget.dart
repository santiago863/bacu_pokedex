import 'package:flutter/material.dart';
import 'package:pokedex/core/config.dart';
import 'package:pokedex/ui/screens/pokemon_search/pokemon_search_screen.dart';
import 'package:pokedex/ui/widgets/atoms/drawer_tile.dart';
import 'package:pokedex/ui/widgets/tokens/app_colors.dart';
import 'package:pokedex/ui/widgets/tokens/app_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 180,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Config.appName,
                    style: AppFonts.title.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'Developed by Santiago Galeano',
                    style: AppFonts.subtitle,
                  ),
                ],
              ),
            ),
          ),
          DrawerTile(
            icon: Icons.list,
            title: 'All Pokemons',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          DrawerTile(
            icon: Icons.search,
            title: 'Search Pokemons',
            onTap: () {
              Navigator.of(context).pushNamed(
                PokemonSearchScreen.route,
              );
            },
          ),
          DrawerTile(
            icon: Icons.language,
            title: 'Language:',
            info: 'English',
            onTap: () => _comingSoon(context),
          ),
          DrawerTile(
            icon: Icons.sunny,
            title: 'Dark mode:',
            info: 'Disabled',
            onTap: () => _comingSoon(context),
          ),
        ],
      ),
    );
  }

  void _comingSoon(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primary,
        content: Text(
          'Coming soon...',
          style: AppFonts.subtitle,
        ),
      ),
    );
  }
}