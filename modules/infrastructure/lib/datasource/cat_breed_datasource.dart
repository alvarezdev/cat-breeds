import 'package:infrastructure/core/constants/config_constants.dart';
import 'package:infrastructure/core/network/client/api_client.dart';
import 'package:infrastructure/dto/cat_breed_dto.dart';
import 'package:infrastructure/mappers/response_mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatBreedDatasource {
  final ApiClient _apiClient;
  final ResponseMapper _mapper;

  CatBreedDatasource({
    required ApiClient apiClient,
    required ResponseMapper mapper,
  })  : _apiClient = apiClient, 
        _mapper = mapper;

  Future<List<CatBreedDto>> getCatBreeds() async {
    final response =
        await _apiClient.get(ConfigConstants.getBreeds);
    return _mapper.fromJsonList<CatBreedDto>(response);
  }
}