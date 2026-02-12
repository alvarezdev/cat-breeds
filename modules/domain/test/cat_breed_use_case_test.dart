import 'package:domain/use_case/cat_breed_use_case.dart';
import 'package:domain/repository/cat_breed_repository.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:test/test.dart';

import 'builder/cat_breed_builder.dart';

class _MockCatBreedRepositorySuccess implements CatBreedRepository {
  final List<CatBreed> catBreeds;

  _MockCatBreedRepositorySuccess(this.catBreeds);

  @override
  Future<List<CatBreed>> getCatBreeds() async => catBreeds;
}

class _MockCatBreedRepositoryFailure implements CatBreedRepository {
  @override
  Future<List<CatBreed>> getCatBreeds() async =>
      throw Exception('Error fetching cat breeds');
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
      expect(result, catBreeds);
      expect(result.length, 2);
      expect(result[0].name, 'Persian');
      expect(result[1].name, 'Siamese');
    });

    test('getCatBreeds should throw an exception when repository fails', () async {
      // Arrange
      final mockRepository = _MockCatBreedRepositoryFailure();
      final useCase = CatBreedUseCase(repository: mockRepository);

      // Act & Assert
      expect(
        () => useCase.getCatBreeds(),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Error fetching cat breeds'),
        )),
      );
    });

    test('getCatBreeds should return empty list when repository returns empty list',
        () async {
      // Arrange
      final mockRepository = _MockCatBreedRepositorySuccess([]);
      final useCase = CatBreedUseCase(repository: mockRepository);

      // Act
      final result = await useCase.getCatBreeds();

      // Assert
      expect(result, isEmpty);
    });
  });
}