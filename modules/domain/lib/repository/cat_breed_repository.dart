import 'package:domain/domain.dart';

abstract class CatBreedRepository {
  Future<Result<Failure, List<CatBreed>>> getCatBreeds();
}
