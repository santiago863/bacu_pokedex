import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/pokedex_cubit.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  static const double _height = 130;
  const SearchAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexState>(
      builder: (context, state) {
        return AppBar(
          centerTitle: true,
          toolbarHeight: _height,
          backgroundColor: AppColors.primary,
          iconTheme: const IconThemeData(
            color: AppColors.black,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          actions: const [
            Icon(
              Icons.search,
            ),
          ],
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search Pokemon',
                style: AppFonts.title.copyWith(
                  color: AppColors.black,
                ),
              ),
              TextFormField(
                onChanged: (query) {
                  context.read<PokedexCubit>().searchPokemon(query);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
