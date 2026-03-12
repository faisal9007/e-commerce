import 'package:flutter/material.dart';

import '../../../features/shared/presentation/widget/ProductsCard.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key, required this.categoryName});
  static const String name = '/products-list';
  final String categoryName;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return FittedBox(child: ProductsCard());
        },
      ),
    );
  }
}
