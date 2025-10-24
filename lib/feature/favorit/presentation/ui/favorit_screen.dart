import 'package:bookia/core/widgets/coustom_app_bar.dart';
import 'package:flutter/material.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(titel: "Favorit", withBackButton: false),

      body: const Center(child: Text('My Favorit Screen')),
    );
  }
}
