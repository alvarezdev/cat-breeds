//@GeneratedMicroModule;InfrastructurePackageModule;package:infrastructure/infrastructure.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:infrastructure/core/network/client/api_client.dart' as _i463;
import 'package:infrastructure/datasource/cat_breed_datasource.dart' as _i803;
import 'package:infrastructure/mappers/mapper_module.dart' as _i747;
import 'package:infrastructure/mappers/response_mapper.dart' as _i866;
import 'package:injectable/injectable.dart' as _i526;

class InfrastructurePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final mapperModule = _$MapperModule();
    gh.lazySingleton<_i866.ResponseMapper>(() => mapperModule.responseMapper());
    gh.factory<_i803.CatBreedDatasource>(() => _i803.CatBreedDatasource(
          apiClient: gh<_i463.ApiClient>(),
          mapper: gh<_i866.ResponseMapper>(),
        ));
  }
}

class _$MapperModule extends _i747.MapperModule {}
