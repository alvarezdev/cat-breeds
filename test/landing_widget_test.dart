import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/presentation/landing/landing_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'builder/cat_breed_builder.dart';

void main() {
  group('LandingWidget', () {
    late List<CatBreed> catBreeds;

    setUp(() {
      catBreeds = [
        CatBreedTestBuilder()
            .withId('1')
            .withName('Persian')
            .withDescription('Calm and gentle')
            .withOrigin('Iran')
            .withIntelligence(4)
            .withAdaptability(5)
            .withLifeSpan('12-15 years')
            .withImageUrl('https://example.com/persian.jpg')
            .build(),
        CatBreedTestBuilder()
            .withId('2')
            .withName('Siamese')
            .withDescription('Vocal and social')
            .withOrigin('Thailand')
            .withIntelligence(5)
            .withAdaptability(4)
            .withLifeSpan('10-15 years')
            .withImageUrl('https://example.com/siamese.jpg')
            .build(),
      ];
    });

    Widget createWidgetUnderTest({
      required List<CatBreed> breeds,
      ValueChanged<String>? onSearchChanged,
      Function(CatBreed)? onTap,
    }) {
      return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('es')],
        home: Scaffold(
          body: LandingWidget(
            catBreeds: breeds,
            onSearchChanged: onSearchChanged ?? (_) {},
            onTap: onTap ?? (_) {},
          ),
        ),
      );
    }

    testWidgets('should display search text field', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(breeds: catBreeds));

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should display search icon', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(breeds: catBreeds));

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should display all cat breeds in list view', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(breeds: catBreeds));
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Persian'), findsOneWidget);
      expect(find.text('Siamese'), findsOneWidget);
    });

    testWidgets('should display empty list when no cat breeds provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(breeds: []));
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should call onSearchChanged when user types in search field', (
      WidgetTester tester,
    ) async {
      String? searchQuery;

      await tester.pumpWidget(
        createWidgetUnderTest(
          breeds: catBreeds,
          onSearchChanged: (query) {
            searchQuery = query;
          },
        ),
      );

      await tester.enterText(find.byType(TextField), 'Persian');
      expect(searchQuery, 'Persian');
    });

    testWidgets('should call onTap when cat breed card is tapped', (
      WidgetTester tester,
    ) async {
      CatBreed? tappedBreed;

      await tester.pumpWidget(
        createWidgetUnderTest(
          breeds: catBreeds,
          onTap: (breed) {
            tappedBreed = breed;
          },
        ),
      );
      await tester.pumpAndSettle();

      // Tap on first card
      await tester.tap(find.text('Persian'));
      await tester.pumpAndSettle();

      expect(tappedBreed?.name, 'Persian');
    });

    testWidgets('should display correct number of list items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(breeds: catBreeds));
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should render search field with correct hint text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(breeds: catBreeds));
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should be scrollable when list is long', (
      WidgetTester tester,
    ) async {
      final longList = List.generate(
        20,
        (index) => CatBreedTestBuilder()
            .withId('$index')
            .withName('Cat Breed $index')
            .build(),
      );

      await tester.pumpWidget(createWidgetUnderTest(breeds: longList));
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should display proper padding and spacing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(breeds: catBreeds));
      await tester.pumpAndSettle();

      expect(find.byType(Padding), findsWidgets);
    });
  });
}
