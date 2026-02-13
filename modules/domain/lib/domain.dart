
library;

import 'package:injectable/injectable.dart';

export 'model/cat_breed.dart';
export 'repository/cat_breed_repository.dart';
export 'use_case/cat_breed_use_case.dart';
export 'core/result.dart';
export 'failures/failures.dart';

@InjectableInit.microPackage()
void initDomain() {}