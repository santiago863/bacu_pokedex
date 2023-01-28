import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/ui/screens/pokemon_list/widgets/pokemon_list_appbar.dart';
import 'package:pokedex/ui/widgets/organism/drawer_widget.dart';
import '../../../cubit/pokedex_cubit.dart';
import 'widgets/pokemon_card.dart';

class PokemonListScreen extends StatefulWidget {
  static const String route = '/pokemon-list';
  const PokemonListScreen({
    super.key,
  });

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final PagingController<int, PokemonEntity> _pagingController =
      PagingController(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) => context.read<PokedexCubit>().fetchPokedex(
            offset: pageKey,
          ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const PokemonListAppbar(),
      body: BlocConsumer<PokedexCubit, PokedexState>(
        listener: (context, state) {
          if (state.status == PokedexStatus.success) {
            int items = 1279;
            final next = _pagingController.itemList != null
                ? _pagingController.itemList!.length
                : 100;
            if (next > items) {
              _pagingController.appendLastPage(state.pokemons);
            } else {
              _pagingController.appendPage(state.pokemons, next);
            }
          }
        },
        builder: (context, state) {
          return PagedListView<int, PokemonEntity>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<PokemonEntity>(
              itemBuilder: (context, item, index) => PokemonCard(
                pokemonEntity: item,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Que cargue bien
// Loader
// Info extra
// Vista detalles

// Buscador Logica
// Buscador visual

// Comparar logica
// Comparar visual

// Menu

// Nuevas funcionalidades

// Pulir