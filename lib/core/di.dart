import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/pokedex_repository_impl.dart';
import '../data/services/pokedex_service.dart';
import 'config.dart';

class DependencyInjection {
  static Future<void> setup() async {
    final getIt = GetIt.instance;

    final dio = Dio(
      BaseOptions(
        baseUrl: Config.host,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );

    getIt.registerSingleton<Dio>(dio);

    getIt.registerSingleton<PokedexRepositoryImpl>(
      PokedexRepositoryImpl(
        PokedexService(dio),
      ),
    );
  }
}
