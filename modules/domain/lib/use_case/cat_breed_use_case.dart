import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatBreedUseCase {
  final CatBreedRepository _repository;

  CatBreedUseCase({
    required CatBreedRepository repository,
  }) : _repository = repository;

  Future<List<CatBreed>> getCatBreeds() {
    return _repository.getCatBreeds();
  }
}