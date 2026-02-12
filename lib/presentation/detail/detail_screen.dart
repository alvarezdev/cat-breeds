import 'package:cat_breeds/presentation/detail/detail_widget.dart';
import 'package:domain/model/cat_breed.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail';

  final CatBreed catBreed;

  const DetailScreen({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(catBreed.name ?? ''), centerTitle: true),
      body: DetailWidget(catBreed: catBreed),
    );
  }
}
