import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/presentation/landing/landing_view_model.dart';
import 'package:cat_breeds/presentation/landing/landing_widget.dart';
import 'package:cat_breeds/shared/dimensions.dart';
import 'package:domain/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreen extends ConsumerWidget {
  static const routeName = 'landing';

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breedsState = ref.watch(breedsViewModelProvider);
    final viewModel = ref.read(breedsViewModelProvider.notifier);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cat breeds",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: breedsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (breeds) => LandingWidget(
          catBreeds: breeds,
          onSearchChanged: viewModel.onSearchChanged,
          onTap: (catBreed) {
            Navigator.pushNamed(context, 'detail', arguments: catBreed);
          },
        ),
        error: (error, _) {
          String message;
          if (error is NetworkFailure) {
            message = l10n.noConnectionError;
          } else if (error is ServerFailure) {
            message = l10n.serverError;
          } else {
            message = l10n.unknownError;
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.d20),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: Dimensions.d16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
