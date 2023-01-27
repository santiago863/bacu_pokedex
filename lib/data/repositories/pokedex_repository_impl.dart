import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokedex_repository.dart';
import '../services/pokedex_service.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexService _pokedexService;
  PokedexRepositoryImpl(
    this._pokedexService,
  );

  @override
  Future<List<PokemonEntity>> getAllPokemons({
    required int limit,
    required int offset,
  }) async {
    return await _pokedexService.getAllPokemons(
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<PokemonEntity> getPokemonById({
    required String pokemonId,
  }) async {
    return await _pokedexService.getPokemonById(
      pokemonId: pokemonId,
    );
  }
}
