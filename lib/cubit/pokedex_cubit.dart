import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/config.dart';
import '../data/repositories/pokedex_repository_impl.dart';
import '../domain/entities/pokemon_entity.dart';

part 'pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  PokedexCubit()
      : super(
          PokedexState(),
        );

  final getIt = GetIt.instance;

  Future<void> fetchPokedex({
    required int offset,
  }) async {
    emit(
      state.copyWith(
        status: PokedexStatus.loading,
      ),
    );
    final pokedexRepository = getIt<PokedexRepositoryImpl>();
    final pokemons = await pokedexRepository.getAllPokemons(
      limit: Config.pokemonsLimitQuery,
      offset: offset,
    );
    emit(
      state.copyWith(
        status: PokedexStatus.success,
        pokemons: pokemons,
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
    if (state.pokemonsCompare.contains(pokemonEntity)) {
      List<PokemonEntity> pokemons = state.pokemonsCompare;
      pokemons.add(pokemonEntity);
      emit(
        state.copyWith(
          status: PokedexStatus.success,
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
      List<PokemonEntity> pokemons = state.pokemonsCompare;
      pokemons.remove(pokemonEntity);
      emit(
        state.copyWith(
          status: PokedexStatus.success,
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
}
