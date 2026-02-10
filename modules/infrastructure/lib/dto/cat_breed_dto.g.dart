// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_breed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatBreedDto _$CatBreedDtoFromJson(Map<String, dynamic> json) => CatBreedDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  origin: json['origin'] as String,
  intelligence: json['intelligence'] as String,
  adaptability: json['adaptability'] as String,
  lifeSpan: json['life_span'] as String,
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$CatBreedDtoToJson(CatBreedDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'origin': instance.origin,
      'intelligence': instance.intelligence,
      'adaptability': instance.adaptability,
      'life_span': instance.lifeSpan,
      'image_url': instance.imageUrl,
    };
