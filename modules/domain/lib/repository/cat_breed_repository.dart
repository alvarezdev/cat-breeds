import 'package:domain/domain.dart';

abstract class CatBreedRepository {
  Future<List<CatBreed>> getCatBreeds();
}
