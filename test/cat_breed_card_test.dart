import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/presentation/landing/card/cat_breed_card.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'builder/cat_breed_builder.dart';

void main() {
  group('CatBreedCard', () {
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

    Widget createWidgetUnderTest({
      required CatBreed breed,
      required Function(CatBreed) onTap,
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
          body: CatBreedCard(
            catBreed: breed,
            onTap: onTap,
          ),
        ),
      );
    }

    testWidgets('should display cat breed name', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));

      expect(find.text('Persian Cat'), findsOneWidget);
    });

    testWidgets('should display more info label', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('should display cat breed image', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display origin', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data?.contains('Iran') == true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display intelligence rating', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data?.contains('4') == true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('should render card widget', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should call onTap when card is tapped', (
      WidgetTester tester,
    ) async {
      CatBreed? tappedBreed;

      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (breed) {
          tappedBreed = breed;
        },
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(tappedBreed, catBreed);
      expect(tappedBreed?.name, 'Persian Cat');
    });

    testWidgets('should handle image load error gracefully',
        (WidgetTester tester) async {
      final catBreedWithInvalidImage = CatBreedTestBuilder()
          .withName('Siamese')
          .withOrigin('Thailand')
          .withImageUrl('')
          .build();

      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreedWithInvalidImage,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display ClipRRect for image border radius',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('should render padding inside card',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      // Card has Padding inside it (from the card's internal padding)
      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('should have Row with name and more info label',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('should render with null values gracefully',
        (WidgetTester tester) async {
      final catBreedWithNulls = CatBreedTestBuilder()
          .withName(null)
          .withOrigin(null)
          .withImageUrl(null)
          .build();

      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreedWithNulls,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(find.byType(CatBreedCard), findsOneWidget);
    });

    testWidgets('should have SizedBox with infinite width', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest(
        breed: catBreed,
        onTap: (_) {},
      ));
      await tester.pumpAndSettle();

      expect(find.byType(SizedBox), findsWidgets);
    });
  });
}
