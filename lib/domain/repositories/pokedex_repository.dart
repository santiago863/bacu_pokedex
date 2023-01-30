import 'package:dartz/dartz.dart';
import '../entities/error_entity.dart';

import '../entities/pokemon_entity.dart';

abstract class PokedexRepository {
  Future<Either<ErrorEntity, List<PokemonEntity>>> getAllPokemons({
    required int limit,
    required int offset,
  });
}
