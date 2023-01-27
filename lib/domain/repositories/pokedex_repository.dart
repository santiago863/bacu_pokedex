import '../entities/pokemon_entity.dart';

abstract class PokedexRepository {
  Future<List<PokemonEntity>> getAllPokemons({
    required int limit,
    required int offset,
  });
  Future<PokemonEntity> getPokemonById({
    required String pokemonId,
  });
}
