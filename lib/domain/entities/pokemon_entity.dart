class PokemonEntity {
  final int id;
  final String url;
  final String imageUrl;
  final String name;
  final List<dynamic> types;
  final int maxHP;
  final int maxCP;
  final int generation;
  final String candy;
  final int height;
  final int weight;
  PokemonEntity({
    required this.id,
    required this.url,
    required this.imageUrl,
    required this.name,
    required this.types,
    required this.maxHP,
    required this.maxCP,
    required this.generation,
    required this.candy,
    required this.height,
    required this.weight,
  });
}
