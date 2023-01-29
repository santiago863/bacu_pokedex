import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/pokedex_repository_impl.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../config.dart';

part 'pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  PokedexCubit()
      : super(
          PokedexState(),
        );

  final getIt = GetIt.instance;
  // late final Timer timer;

  // void initCubit() {
  // timer = Timer.periodic(
  //   const Duration(
  //     seconds: 10,
  //   ),
  //   (timer) async => await fetchPokedex(),
  // );
  // }

  Future<void> fetchPokedex() async {
    print('Consulto: offset = ${state.offset}');
    if (state.timer == null) {
      print('Se creo el timer');
      emit(
        state.copyWith(
          timer: Timer.periodic(
            const Duration(
              seconds: 5,
            ),
            (timer) async {
              // print('offset = ${state.offset}');
              // print('pokemons = ${state.pokemons.length}');
              await fetchPokedex();
            },
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        status: PokedexStatus.loading,
      ),
    );
    final pokedexRepository = getIt<PokedexRepositoryImpl>();
    final newPokemons = await pokedexRepository.getAllPokemons(
      limit: Config.pokemonsLimitQuery,
      offset: state.offset,
    );
    final List<PokemonEntity> pokemons = [];
    pokemons.addAll(state.pokemons);
    pokemons.addAll(newPokemons);
    emit(
      state.copyWith(
        status: PokedexStatus.success,
        pokemons: pokemons,
        offset: pokemons.length,
      ),
    );
  }

  void addToCompare({
    required PokemonEntity pokemonEntity,
  }) {
    emit(
      state.copyWith(
        status: PokedexStatus.loading,
      ),
    );
    if (!state.pokemonsCompare.contains(pokemonEntity)) {
      List<PokemonEntity> pokemons = [];
      pokemons.addAll(
        state.pokemonsCompare,
      );
      pokemons.add(pokemonEntity);
      emit(
        state.copyWith(
          pokemonsCompare: pokemons,
        ),
      );
    }
    emit(
      state.copyWith(
        status: PokedexStatus.success,
      ),
    );
  }

  void removeToCompare({
    required PokemonEntity pokemonEntity,
  }) {
    emit(
      state.copyWith(
        status: PokedexStatus.loading,
      ),
    );
    if (state.pokemonsCompare.contains(pokemonEntity)) {
      List<PokemonEntity> pokemons = [];
      pokemons.addAll(
        state.pokemonsCompare,
      );
      pokemons.remove(pokemonEntity);
      emit(
        state.copyWith(
          pokemonsCompare: pokemons,
        ),
      );
    }
    emit(
      state.copyWith(
        status: PokedexStatus.success,
      ),
    );
  }

  void searchPokemon(String query) {
    emit(
      state.copyWith(
        status: PokedexStatus.loading,
        query: query,
      ),
    );
    List<PokemonEntity> pokemons = state.pokemons
        .where(
          (p) => p.name.contains(query),
        )
        .toList();
    emit(
      state.copyWith(
        status: PokedexStatus.success,
        pokemonsSearch: pokemons,
      ),
    );
  }
}
