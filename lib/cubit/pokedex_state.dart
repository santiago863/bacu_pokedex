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

  PokedexState({
    this.status = PokedexStatus.initial,
    this.pokemons = const [],
  });

  PokedexState copyWith({
    PokedexStatus? status,
    List<PokemonEntity>? pokemons,
  }) {
    return PokedexState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
    );
  }
}
