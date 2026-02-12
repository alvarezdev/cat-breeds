
library;

import 'package:injectable/injectable.dart';

export 'model/cat_breed.dart';
export 'repository/cat_breed_repository.dart';
export 'use_case/cat_breed_use_case.dart';

@InjectableInit.microPackage()
void initDomain() {}