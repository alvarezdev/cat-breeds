import 'package:cat_breeds/presentation/landing/landing_view_model.dart';
import 'package:cat_breeds/presentation/landing/landing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreen extends ConsumerWidget {
  static const routeName = 'landing';

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breedsState = ref.watch(breedsViewModelProvider);
    final viewModel = ref.read(breedsViewModelProvider.notifier);

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
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (breeds) => LandingWidget(
          catBreeds: breeds,
          onSearchChanged: viewModel.onSearchChanged,
          onTap: (catBreed) {
            Navigator.pushNamed(context, 'detail', arguments: catBreed);
          },
        ),
      ),
    );
  }
}
