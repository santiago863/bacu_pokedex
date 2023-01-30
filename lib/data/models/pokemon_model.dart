import '../../domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.url,
    required super.imageUrl,
    required super.name,
    required super.types,
    required super.moves,
    required super.height,
    required super.weight,
    required super.stamina,
    required super.attack,
    required super.defence,
    required super.maxAttack,
    required super.maxDefence,
    required super.speed,
    super.description,
    super.color,
    super.captureRate,
    super.generation,
    super.region,
    super.foundIn,
    super.candy,
    super.evolves,
    super.shape,
    super.baby,
  });

  factory PokemonModel.fromMap(
    Map<String, dynamic> json,
  ) {
    return PokemonModel(
      name: json['name'],
      id: json['id'],
      url: json['url'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: json['types'].map((item) => item['type']['name']).toList(),
      moves: json['moves'].map((item) => item['move']['name']).toList(),
      height: json['height'],
      weight: json['weight'],
      stamina: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defence: json['stats'][2]['base_stat'],
      maxAttack: json['stats'][3]['base_stat'],
      maxDefence: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
    );
  }

  Map<String, dynamic> toMap(
    PokemonEntity data,
  ) =>
      {};

  PokemonModel copyWith({
    int? id,
    String? url,
    String? imageUrl,
    String? name,
    List<dynamic>? types,
    List<dynamic>? moves,
    int? height,
    int? weight,
    int? stamina,
    int? attack,
    int? defence,
    int? maxAttack,
    int? maxDefence,
    int? speed,
    String? description,
    String? color,
    int? captureRate,
    String? generation,
    String? region,
    String? foundIn,
    String? candy,
    List<dynamic>? evolves,
    String? shape,
    bool? baby,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      types: types ?? this.types,
      moves: moves ?? this.moves,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      stamina: stamina ?? this.stamina,
      attack: attack ?? this.attack,
      defence: defence ?? this.defence,
      maxAttack: maxAttack ?? this.maxAttack,
      maxDefence: maxDefence ?? this.maxDefence,
      speed: speed ?? this.speed,
      description: description ?? this.description,
      color: color ?? this.color,
      captureRate: captureRate ?? this.captureRate,
      generation: generation ?? this.generation,
      region: region ?? this.region,
      foundIn: foundIn ?? this.foundIn,
      candy: candy ?? this.candy,
      evolves: evolves ?? this.evolves,
      shape: shape ?? this.shape,
      baby: baby ?? this.baby,
    );
  }
}
