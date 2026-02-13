// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Cat Breeds';

  @override
  String get searchHint => 'Search breed...';

  @override
  String get imageNotAvailable => 'Image not available';

  @override
  String get originLabel => 'Country of origin:';

  @override
  String get intelligenceLabel => 'Intelligence:';

  @override
  String get adaptabilityLabel => 'Adaptability:';

  @override
  String get lifeSpanLabel => 'Life expectancy:';

  @override
  String get moreInfoLabel => 'More...';

  @override
  String get noConnectionError =>
      'No internet connection. Please check your connection and try again.';

  @override
  String get serverError =>
      'An error occurred while fetching data. Please try again later.';

  @override
  String get unknownError =>
      'An unexpected error occurred. Please try again later.';
}
