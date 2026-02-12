import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/shared/dimensions.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:flutter/material.dart';

class CatBreedCard extends StatelessWidget {
  final CatBreed catBreed;
  final void Function(CatBreed) onTap;

  const CatBreedCard({
    super.key,
    required this.catBreed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: GestureDetector(
        onTap: () => onTap(catBreed),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.d12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.d16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [ 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        catBreed.name ?? '',
                        style: TextStyle(
                          fontSize: Dimensions.d16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        l10n.moreInfoLabel,
                        style: TextStyle(fontSize: Dimensions.d14, color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(height: Dimensions.d16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.d16),
                    child: Image.network(
                      catBreed.imageUrl ?? '',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Text(
                          l10n.imageNotAvailable,
                          style: TextStyle(color: Colors.red),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.d16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        catBreed.origin ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        catBreed.intelligence != null
                            ? catBreed.intelligence.toString()
                            : '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
