import 'package:domain/model/cat_breed.dart';
import 'package:infrastructure/datasource/cat_breed_datasource.dart';
import 'package:domain/repository/cat_breed_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CatBreedRepository)
class CatBreedRepositoryImpl implements CatBreedRepository {
  final CatBreedDatasource _datasource;

  CatBreedRepositoryImpl(this._datasource);

  @override
  Future<List<CatBreed>> getCatBreeds() async {
    final departments = await _datasource.getCatBreeds();

    return departments
        .map(
          (item) => CatBreed(
            id: item.id,
            name: item.name,
            description: item.description,
            origin: item.origin,
            intelligence: item.intelligence,
            adaptability: item.adaptability,
            lifeSpan: item.lifeSpan,
            imageUrl: item.imageUrl,
          ),
        )
        .toList();
  }
}
