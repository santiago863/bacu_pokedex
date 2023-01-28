import 'base_model.dart';
import '../../domain/entities/pokemon_entity.dart';

class PokemonModel implements BaseModel<PokemonEntity> {
  @override
  PokemonEntity fromMap(
    Map<String, dynamic> json,
  ) {
    return PokemonEntity(
      name: json['name'],
      id: json['id'],
      url: json['url'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: json['types'].map((item) => item['type']['name']).toList(),
      maxHP: json['stats'][0]['base_stat'],
      maxCP: json['stats'][1]['base_stat'],
      generation: 0,
      candy: 'x',
      height: json['height'],
      weight: json['weight'],
    );
  }

  @override
  Map<String, dynamic> toMap(
    PokemonEntity data,
  ) =>
      {};
}
