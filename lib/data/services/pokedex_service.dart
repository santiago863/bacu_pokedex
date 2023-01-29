import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/error_entity.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokedex_repository.dart';
import '../models/pokemon_model.dart';

class PokedexService implements PokedexRepository {
  final Dio _dio;
  PokedexService(
    this._dio,
  );

  @override
  Future<Either<ErrorEntity, List<PokemonEntity>>> getAllPokemons({
    required int limit,
    required int offset,
  }) async {
    try {
      List<PokemonEntity> pokemons = [];
      final response = await _dio.get(
        '/pokemon',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );
      for (var item in response.data['results']) {
        final responseGetPokemonById = await getPokemonById(
          pokemonId: item['name'],
        );
        PokemonModel? pokemon;
        responseGetPokemonById.fold(
          (l) => null,
          (r) => pokemon = r,
        );
        if (responseGetPokemonById.isRight()) {
          final responseGetPokemonSpecies = await getPokemonSpecies(
            pokemonModel: pokemon!,
          );
          responseGetPokemonSpecies.fold(
            (l) => null,
            (r) => pokemons.add(
              r,
            ),
          );
        }
      }
      return Right(pokemons);
    } catch (e) {
      return Left(
        ErrorEntity(
          code: 0001,
          message: 'getAllPokemons: ${e.toString()}',
        ),
      );
    }
  }

  Future<Either<ErrorEntity, PokemonModel>> getPokemonById({
    required String pokemonId,
  }) async {
    try {
      final response = await _dio.get(
        '/pokemon/$pokemonId',
      );
      return Right(
        PokemonModel.fromMap(
          response.data,
        ),
      );
    } catch (e) {
      return Left(
        ErrorEntity(
          code: 0002,
          message: 'getPokemonById: ${e.toString()}',
        ),
      );
    }
  }

  Future<Either<ErrorEntity, PokemonModel>> getPokemonSpecies({
    required PokemonModel pokemonModel,
  }) async {
    try {
      final response = await _dio.get(
        '/pokemon-species/${pokemonModel.id}',
      );
      Map<String, dynamic> json = response.data;
      if (json['evolution_chain'] != null) {
        final responseGetPokemonEvolutionChain = await getPokemonEvolutionChain(
          evolutionChainUrl: json['evolution_chain']['url'],
          pokemonModel: pokemonModel,
        );
        responseGetPokemonEvolutionChain.fold(
          (l) => null,
          (r) => pokemonModel = r,
        );
      }
      final responseGetPokemonGeneration = await getPokemonGeneration(
        generationUrl: json['generation']['url'],
        pokemonModel: pokemonModel,
      );
      responseGetPokemonGeneration.fold(
        (l) => null,
        (r) => pokemonModel = r,
      );
      pokemonModel;
      return Right(
        pokemonModel.copyWith(
          description: json['flavor_text_entries'].length > 0
              ? json['flavor_text_entries'][0]['flavor_text']
              : 'N/A',
          color: json['color']['name'],
          captureRate: json['capture_rate'],
          foundIn: json['habitat'] != null ? json['habitat']['name'] : 'N/A',
          shape: json['shape'] != null ? json['shape']['name'] : 'N/A',
          baby: json['is_baby'],
        ),
      );
    } catch (e) {
      return Left(
        ErrorEntity(
          code: 0003,
          message: 'getPokemonSpecies: ${e.toString()}',
        ),
      );
    }
  }

  Future<Either<ErrorEntity, PokemonModel>> getPokemonEvolutionChain({
    required String evolutionChainUrl,
    required PokemonModel pokemonModel,
  }) async {
    try {
      final response = await _dio.get(
        evolutionChainUrl,
      );
      Map<String, dynamic> json = response.data;
      List<dynamic> evolves = [];
      if (json['chain']['evolves_to'].length > 0) {
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
      }
      return Right(
        pokemonModel.copyWith(
          candy: json['chain']['species']['name'],
          evolves: evolves,
        ),
      );
    } catch (e) {
      return Left(
        ErrorEntity(
          code: 0004,
          message: 'getPokemonEvolutionChain: ${e.toString()}',
        ),
      );
    }
  }

  Future<Either<ErrorEntity, PokemonModel>> getPokemonGeneration({
    required String generationUrl,
    required PokemonModel pokemonModel,
  }) async {
    try {
      final response = await _dio.get(
        generationUrl,
      );
      Map<String, dynamic> json = response.data;
      return Right(
        pokemonModel.copyWith(
          generation: json['name'],
          region: json['main_region']['name'],
        ),
      );
    } catch (e) {
      return Left(
        ErrorEntity(
          code: 0005,
          message: 'getPokemonGeneration: ${e.toString()}',
        ),
      );
    }
  }
}
