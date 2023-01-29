import 'package:dio/dio.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokedex_repository.dart';
import '../models/pokemon_model.dart';

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
      PokemonModel pokemon = await getPokemonById(
        pokemonId: item['name'],
      );

      pokemons.add(
        await getPokemonSpecies(
          pokemonModel: pokemon,
        ),
      );
    }
    return pokemons;
  }

  Future<PokemonModel> getPokemonById({
    required String pokemonId,
  }) async {
    final response = await _dio.get(
      '/pokemon/$pokemonId',
    );
    return PokemonModel.fromMap(
      response.data,
    );
  }

  Future<PokemonModel> getPokemonSpecies({
    required PokemonModel pokemonModel,
  }) async {
    final response = await _dio.get(
      '/pokemon-species/${pokemonModel.id}',
    );
    Map<String, dynamic> json = response.data;
    pokemonModel = await getPokemonEvolutionChain(
      evolutionChainUrl: json['evolution_chain']['url'],
      pokemonModel: pokemonModel,
    );
    pokemonModel = await getPokemonGeneration(
      generationUrl: json['generation']['url'],
      pokemonModel: pokemonModel,
    );
    return pokemonModel.copyWith(
      description: json['flavor_text_entries'][13]['flavor_text'],
      color: json['color']['name'],
      captureRate: json['capture_rate'],
      foundIn: json['habitat']['name'],
      shape: json['shape']['name'],
      baby: json['is_baby'],
    );
  }

  Future<PokemonModel> getPokemonEvolutionChain({
    required String evolutionChainUrl,
    required PokemonModel pokemonModel,
  }) async {
    final response = await _dio.get(
      evolutionChainUrl,
    );
    Map<String, dynamic> json = response.data;
    List<dynamic> evolves = [];
    var evolutionItem = json['chain']['evolves_to'][0];
    while (true) {
      evolves.add(
        evolutionItem['species']['name'],
      );
      if (evolutionItem['evolves_to'].length > 0) {
        evolutionItem = evolutionItem['evolves_to'][0];
      } else {
        break;
      }
    }
    return pokemonModel.copyWith(
      candy: json['chain']['species']['name'],
      evolves: evolves,
    );
  }

  Future<PokemonModel> getPokemonGeneration({
    required String generationUrl,
    required PokemonModel pokemonModel,
  }) async {
    final response = await _dio.get(
      generationUrl,
    );
    Map<String, dynamic> json = response.data;
    return pokemonModel.copyWith(
      generation: json['name'],
      region: json['main_region']['name'],
    );
  }
}
