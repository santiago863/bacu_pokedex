import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entities/error_entity.dart';

import '../entities/pokemon_entity.dart';

abstract class PokedexRepository {
  Future<Either<ErrorEntity, List<PokemonEntity>>> getAllPokemons({
    required int limit,
    required int offset,
  });
}
