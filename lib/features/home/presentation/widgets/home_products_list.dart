import 'package:flutter/material.dart';
import '../../../../products/presentation/screen/products_detail_screen.dart';
import '../../../shared/presentation/widget/ProductsCard.dart';


class HomeProductsList extends StatelessWidget {
  const HomeProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProductDetailScreen(),
                ),
              );
            },
            child: ProductsCard(),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }
}