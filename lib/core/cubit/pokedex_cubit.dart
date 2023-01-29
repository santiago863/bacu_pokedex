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

  Future<void> fetchPokedex() async {
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
    pokemons.addAll(state.pokemons + newPokemons);
    emit(
      state.copyWith(
        status: PokedexStatus.success,
        pokemons: pokemons,
        offset: state.pokemons.length,
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
