part of 'pokedex_cubit.dart';

enum PokedexStatus {
  initial,
  loading,
  success,
  error,
}

class PokedexState {
  final PokedexStatus status;
  final List<PokemonEntity> pokemons;
  final int offset;
  final int limit = Config.pokemonsLimitQuery;

  PokedexState({
    this.status = PokedexStatus.initial,
    this.pokemons = const [],
    this.offset = 0,
  });

  PokedexState copyWith({
    PokedexStatus? status,
    List<PokemonEntity>? pokemons,
    int? offset,
  }) {
    return PokedexState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      offset: offset ?? this.offset,
    );
  }
}
