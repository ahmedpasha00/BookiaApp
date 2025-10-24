import 'package:bookia/core/widgets/coustom_app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(titel: "Cart",withBackButton: false),
      body: const Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}