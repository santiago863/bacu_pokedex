class PokemonEntity {
  final int id;
  final String url;
  final String imageUrl;
  final String name;
  final List<dynamic> types;
  final List<dynamic> moves;
  final int height;
  final int weight;
  final int stamina;
  final int attack;
  final int defence;
  final String? description;
  final String? color;
  final int? captureRate;
  final String? generation;
  final String? region;
  final String? foundIn;
  final String? candy;
  final List<dynamic>? evolves;
  final String? shape;
  final bool? baby;
  PokemonEntity({
    required this.id,
    required this.url,
    required this.imageUrl,
    required this.name,
    required this.types,
    required this.moves,
    required this.height,
    required this.weight,
    required this.stamina,
    required this.attack,
    required this.defence,
    this.description,
    this.color,
    this.captureRate,
    this.generation,
    this.region,
    this.foundIn,
    this.candy,
    this.evolves,
    this.shape,
    this.baby,
  });
}
