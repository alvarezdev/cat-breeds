// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Cat Breeds';

  @override
  String get searchHint => 'Buscar raza...';

  @override
  String get imageNotAvailable => 'Imagen no disponible';

  @override
  String get originLabel => 'País de origen:';

  @override
  String get intelligenceLabel => 'Inteligencia:';

  @override
  String get adaptabilityLabel => 'Adaptabilidad:';

  @override
  String get lifeSpanLabel => 'Expectativa de vida:';

  @override
  String get moreInfoLabel => 'Más...';
}
