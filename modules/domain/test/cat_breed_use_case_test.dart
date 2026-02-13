import 'package:domain/use_case/cat_breed_use_case.dart';
import 'package:domain/repository/cat_breed_repository.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:domain/core/result.dart';
import 'package:domain/failures/failures.dart';
import 'package:test/test.dart';

import 'builder/cat_breed_builder.dart';

class _MockCatBreedRepositorySuccess implements CatBreedRepository {
  final List<CatBreed> catBreeds;

  _MockCatBreedRepositorySuccess(this.catBreeds);

  @override
  Future<Result<Failure, List<CatBreed>>> getCatBreeds() async =>
      Result.right(catBreeds);
}

class _MockCatBreedRepositoryFailure implements CatBreedRepository {
  final Failure failure;

  _MockCatBreedRepositoryFailure(this.failure);

  @override
  Future<Result<Failure, List<CatBreed>>> getCatBreeds() async =>
      Result.left(failure);
}

void main() {
  group('CatBreedUseCase', () {
    test('getCatBreeds should return a list of CatBreed when repository returns data',
        () async {
      // Arrange
      final catBreeds = [
        CatBreedTestBuilder()
          .withId('1')
          .withName('Persian')
          .withDescription('Calm and gentle')
          .withOrigin('Iran')
          .withIntelligence(4)
          .withAdaptability(5)
          .withLifeSpan('12-15 years')
          .withImageUrl('http://example.com/persian.jpg')
          .build(),
        CatBreedTestBuilder()
          .withId('2')
          .withName('Siamese')
          .withDescription('Vocal and social')
          .withOrigin('Thailand')
          .withIntelligence(5)
          .withAdaptability(4)
          .withLifeSpan('10-15 years')
          .withImageUrl('http://example.com/siamese.jpg')
          .build(),
      ];

      final mockRepository = _MockCatBreedRepositorySuccess(catBreeds);
      final useCase = CatBreedUseCase(repository: mockRepository);

      // Act
      final result = await useCase.getCatBreeds();

      // Assert
      expect(result.isRight, true);
      expect(result.right, catBreeds);
      expect(result.right?.length, 2);
      expect(result.right?[0].name, 'Persian');
      expect(result.right?[1].name, 'Siamese');
    });

    test('getCatBreeds should return failure when repository fails', () async {
      // Arrange
      final failure = NetworkFailure();
      final mockRepository = _MockCatBreedRepositoryFailure(failure);
      final useCase = CatBreedUseCase(repository: mockRepository);

      // Act
      final result = await useCase.getCatBreeds();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, isA<NetworkFailure>());
    });

    test('getCatBreeds should return empty list when repository returns empty list',
        () async {
      // Arrange
      final mockRepository = _MockCatBreedRepositorySuccess([]);
      final useCase = CatBreedUseCase(repository: mockRepository);

      // Act
      final result = await useCase.getCatBreeds();

      // Assert
      expect(result.isRight, true);
      expect(result.right, isEmpty);
    });
  });
}