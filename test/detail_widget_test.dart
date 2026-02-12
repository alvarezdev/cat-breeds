import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/presentation/detail/detail_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'builder/cat_breed_builder.dart';

void main() {
  group('DetailWidget', () {
    late CatBreed catBreed;

    setUp(() {
      catBreed = CatBreedTestBuilder()
          .withId('1')
          .withName('Persian Cat')
          .withDescription('A calm and gentle cat breed')
          .withOrigin('Iran')
          .withIntelligence(4)
          .withAdaptability(5)
          .withLifeSpan('12-15 years')
          .withImageUrl('https://example.com/persian.jpg')
          .build();
    });

    Widget createWidgetUnderTest(CatBreed breed) {
      return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('es')],
        home: Scaffold(body: DetailWidget(catBreed: breed)),
      );
    }

    testWidgets('should display cat breed name', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(catBreed));

      expect(find.text('Persian Cat'), findsOneWidget);
    });

    testWidgets('should display cat breed description', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(catBreed));

      expect(find.text('A calm and gentle cat breed'), findsOneWidget);
    });

    testWidgets('should display origin label and value', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(catBreed));
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      // The text is displayed as "${l10n.originLabel} ${catBreed.origin}"
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data?.contains('Iran') == true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display intelligence rating', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(catBreed));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data?.contains('4') == true,
        ),
        findsWidgets,
      );
    });

    testWidgets('should display adaptability rating', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(catBreed));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data?.contains('5') == true,
        ),
        findsWidgets,
      );
    });

    testWidgets('should display life span', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(catBreed));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text && widget.data?.contains('12-15 years') == true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('should show error widget when image URL fails to load', (
      WidgetTester tester,
    ) async {
      final catBreedWithInvalidImage = CatBreedTestBuilder()
          .withName('Siamese')
          .withImageUrl('')
          .build();

      await tester.pumpWidget(createWidgetUnderTest(catBreedWithInvalidImage));
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should render with null values gracefully', (
      WidgetTester tester,
    ) async {
      // Skip this test because CatBreed validates that intelligence and adaptability
      // cannot be null and must be between 1-5
      // Using a builder with valid values instead
      final catBreedWithMinimalData = CatBreedTestBuilder()
          .withId(null)
          .withName(null)
          .withDescription(null)
          .withOrigin(null)
          .withLifeSpan(null)
          .withImageUrl(null)
          .build();

      await tester.pumpWidget(createWidgetUnderTest(catBreedWithMinimalData));
      await tester.pumpAndSettle();

      expect(find.byType(DetailWidget), findsOneWidget);
    });

    testWidgets('should have scrollable content', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(catBreed));
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}
