import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/config.dart';
import 'package:pokedex/data/repositories/pokedex_repository_impl.dart';

import '../domain/entities/pokemon_entity.dart';

part 'pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  PokedexCubit()
      : super(
          PokedexState(),
        );

  final getIt = GetIt.instance;

  Future<void> fetchPokedex() async {
    final pokedexRepository = getIt<PokedexRepositoryImpl>();
    final newPokemons = await pokedexRepository.getAllPokemons(
      limit: state.limit,
      offset: state.offset,
    );
    emit(
      state.copyWith(
        pokemons: state.pokemons + newPokemons,
      ),
    );
  }
}
