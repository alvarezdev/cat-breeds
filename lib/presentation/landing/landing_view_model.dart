import 'package:cat_breeds/di/dependency_injection.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:domain/use_case/cat_breed_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final breedsViewModelProvider =
    AsyncNotifierProvider<CatBreedsViewModel, List<CatBreed>>(
      CatBreedsViewModel.new,
    );

class CatBreedsViewModel extends AsyncNotifier<List<CatBreed>> {
  late final CatBreedUseCase _catBreedUseCase = getIt<CatBreedUseCase>();

  List<CatBreed> _allBreeds = [];
  String _searchQuery = '';

  @override
  Future<List<CatBreed>> build() async {
    final result = await _catBreedUseCase.getCatBreeds();

    if (result.isRight) {
      _allBreeds = result.right!;
      return _allBreeds;
    } else {
      throw result.left!;
    }
  }

  void onSearchChanged(String query) {
    _searchQuery = query.toLowerCase();

    if (_searchQuery.isEmpty) {
      state = AsyncData(_allBreeds);
      return;
    }

    final filtered = _allBreeds.where((breed) {
      return (breed.name ?? '').toLowerCase().contains(_searchQuery);
    }).toList();

    state = AsyncData(filtered);
  }
}
