class CatBreed {
  final String? id;
  final String? name;
  final String? description;
  final String? origin;
  final int? intelligence;
  final int? adaptability;
  final String? lifeSpan;
  final String? imageUrl;

  CatBreed({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.intelligence,
    required this.adaptability,
    required this.lifeSpan,
    required this.imageUrl,
  }){
    _validate();
  }

  void _validate() {
    if (intelligence! < 1 || intelligence! > 5) {
      throw ArgumentError('Intelligence must be between 1 and 5');
    }
    if (adaptability! < 1 || adaptability! > 5) {
      throw ArgumentError('Adaptability must be between 1 and 5');
    }
  }
}