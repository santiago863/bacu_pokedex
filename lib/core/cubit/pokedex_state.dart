part of 'pokedex_cubit.dart';

enum PokedexStatus {
  initial,
  loading,
  success,
  error,
}

class PokedexState {
  final PokedexStatus status;
  final int offset;
  final List<PokemonEntity> pokemons;
  final List<PokemonEntity> pokemonsCompare;
  final List<PokemonEntity> pokemonsSearch;
  final String query;

  PokedexState({
    this.status = PokedexStatus.initial,
    this.offset = 0,
    this.pokemons = const [],
    this.pokemonsCompare = const [],
    this.pokemonsSearch = const [],
    this.query = '',
  });

  PokedexState copyWith({
    PokedexStatus? status,
    int? offset,
    List<PokemonEntity>? pokemons,
    List<PokemonEntity>? pokemonsCompare,
    List<PokemonEntity>? pokemonsSearch,
    String? query,
  }) {
    return PokedexState(
      status: status ?? this.status,
      offset: offset ?? this.offset,
      pokemons: pokemons ?? this.pokemons,
      pokemonsCompare: pokemonsCompare ?? this.pokemonsCompare,
      pokemonsSearch: pokemonsSearch ?? this.pokemonsSearch,
      query: query ?? this.query,
    );
  }
}
