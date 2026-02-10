
import 'package:json_annotation/json_annotation.dart';

part 'cat_breed_dto.g.dart';

@JsonSerializable()
class CatBreedDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'origin')
  final String origin;

  @JsonKey(name: 'intelligence')
  final String intelligence;

  @JsonKey(name: 'adaptability')
  final String adaptability;

  @JsonKey(name: 'life_span')
  final String lifeSpan;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  CatBreedDto({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.intelligence,
    required this.adaptability,
    required this.lifeSpan,
    required this.imageUrl,
  });

  factory CatBreedDto.fromJson(Map<String, dynamic> json) =>
      _$CatBreedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedDtoToJson(this);
}