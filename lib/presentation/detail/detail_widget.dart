import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/shared/dimensions.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final CatBreed catBreed;

  const DetailWidget({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * Dimensions.d0p5,
          width: double.infinity,
          child: Image.network(
            catBreed.imageUrl ?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Center(child: Text(l10n.imageNotAvailable)),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(Dimensions.d12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.d16),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catBreed.name ?? '',
                    style: const TextStyle(
                      fontSize: Dimensions.d22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Dimensions.d16),
                  Text(
                    catBreed.description ?? '',
                    style: const TextStyle(fontSize: Dimensions.d14),
                  ),
                  const SizedBox(height: Dimensions.d24),
                  Text(
                    "${l10n.originLabel} ${catBreed.origin ?? ''}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: Dimensions.d24),
                  Text(
                    "${l10n.intelligenceLabel} ${catBreed.intelligence.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: Dimensions.d24),
                  Text(
                    "${l10n.adaptabilityLabel} ${catBreed.adaptability.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: Dimensions.d24),
                  Text(
                    "${l10n.lifeSpanLabel} ${catBreed.lifeSpan ?? ''}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: Dimensions.d24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
