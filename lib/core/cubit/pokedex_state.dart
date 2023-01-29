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
  final List<PokemonEntity> pokemonsCompare;
  final List<PokemonEntity> pokemonsSearch;

  PokedexState({
    this.status = PokedexStatus.initial,
    this.pokemons = const [],
    this.pokemonsCompare = const [],
    this.pokemonsSearch = const [],
  });

  PokedexState copyWith({
    PokedexStatus? status,
    List<PokemonEntity>? pokemons,
    List<PokemonEntity>? pokemonsCompare,
    List<PokemonEntity>? pokemonsSearch,
  }) {
    return PokedexState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      pokemonsCompare: pokemonsCompare ?? this.pokemonsCompare,
      pokemonsSearch: pokemonsSearch ?? this.pokemonsSearch,
    );
  }
}
