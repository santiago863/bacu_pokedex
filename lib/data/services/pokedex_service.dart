import 'package:dio/dio.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import '../../domain/entities/pokemon_entity.dart';

import '../../domain/repositories/pokedex_repository.dart';

class PokedexService implements PokedexRepository {
  final Dio _dio;
  PokedexService(
    this._dio,
  );

  @override
  Future<List<PokemonEntity>> getAllPokemons({
    required int limit,
    required int offset,
  }) async {
    List<PokemonEntity> pokemons = [];
    final response = await _dio.get(
      '/pokemon',
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );
    for (var item in response.data['results']) {
      pokemons.add(
        await getPokemonById(
          pokemonId: item['name'],
        ),
      );
    }
    return pokemons;
  }

  @override
  Future<PokemonEntity> getPokemonById({
    required String pokemonId,
  }) async {
    final response = await _dio.get(
      '/pokemon/$pokemonId',
    );
    return PokemonModel().fromMap(
      response.data,
    );
  }
}
