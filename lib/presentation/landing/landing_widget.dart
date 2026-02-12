import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/presentation/landing/card/cat_breed_card.dart';
import 'package:cat_breeds/shared/dimensions.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class LandingWidget extends StatefulWidget {
  final List<CatBreed> catBreeds;
  final ValueChanged<String> onSearchChanged;
  final void Function(CatBreed) onTap;

  const LandingWidget({
    super.key,
    required this.catBreeds,
    required this.onSearchChanged,
    required this.onTap,
  });

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: widget.onSearchChanged,
            decoration: InputDecoration(
              hintText: l10n.searchHint,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.d16),
              ),
            ),
          ),

          const SizedBox(height: Dimensions.d20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.catBreeds.length,
              itemBuilder: (context, index) {
                final catBreed = widget.catBreeds[index];
                return CatBreedCard(
                  catBreed: catBreed,
                  onTap: widget.onTap,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
