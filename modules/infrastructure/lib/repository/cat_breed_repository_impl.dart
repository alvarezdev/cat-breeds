import 'package:domain/domain.dart';
import 'package:infrastructure/core/exception/exception.dart';
import 'package:infrastructure/datasource/cat_breed_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CatBreedRepository)
class CatBreedRepositoryImpl implements CatBreedRepository {
  final CatBreedDatasource _datasource;

  CatBreedRepositoryImpl(this._datasource);

  @override
  Future<Result<Failure, List<CatBreed>>> getCatBreeds() async {
    try {
      final breeds = await _datasource.getCatBreeds();
      final entities = breeds
          .map(
            (item) => CatBreed(
              id: item.id,
              name: item.name,
              description: item.description,
              origin: item.origin,
              intelligence: item.intelligence,
              adaptability: item.adaptability,
              lifeSpan: item.lifeSpan,
              imageUrl: item.image?.url,
            ),
          )
          .toList();

      return Result.right(entities);
    } on NoConnectionException {
      return Result.left(NetworkFailure());
    } on ServerException catch (e) {
      return Result.left(ServerFailure(e.message));
    }
  }
}
