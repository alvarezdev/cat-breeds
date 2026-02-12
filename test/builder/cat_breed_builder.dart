import 'package:domain/domain.dart';

class CatBreedTestBuilder {
  String? _id;
  String? _name;
  String? _description;
  String? _origin;
  int? _intelligence;
  int? _adaptability;
  String? _lifeSpan;
  String? _imageUrl;

  CatBreedTestBuilder() {
    _setDefaults();
  }

  void _setDefaults() {
    _id = '1';
    _name = 'Test Cat';
    _description = 'A test cat breed';
    _origin = 'Test Origin';
    _intelligence = 3;
    _adaptability = 3;
    _lifeSpan = '10-15 years';
    _imageUrl = 'http://example.com/cat.jpg';
  }

  CatBreedTestBuilder withId(String? id) {
    _id = id;
    return this;
  }

  CatBreedTestBuilder withName(String? name) {
    _name = name;
    return this;
  }

  CatBreedTestBuilder withDescription(String? description) {
    _description = description;
    return this;
  }

  CatBreedTestBuilder withOrigin(String? origin) {
    _origin = origin;
    return this;
  }

  CatBreedTestBuilder withIntelligence(int? intelligence) {
    _intelligence = intelligence;
    return this;
  }

  CatBreedTestBuilder withAdaptability(int? adaptability) {
    _adaptability = adaptability;
    return this;
  }

  CatBreedTestBuilder withLifeSpan(String? lifeSpan) {
    _lifeSpan = lifeSpan;
    return this;
  }

  CatBreedTestBuilder withImageUrl(String? imageUrl) {
    _imageUrl = imageUrl;
    return this;
  }

  CatBreed build() {
    return CatBreed(
      id: _id,
      name: _name,
      description: _description,
      origin: _origin,
      intelligence: _intelligence,
      adaptability: _adaptability,
      lifeSpan: _lifeSpan,
      imageUrl: _imageUrl,
    );
  }
}
