import 'package:flutter/material.dart';

import '../../../shared/presentation/widget/ProductsCard.dart';

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          return ProductsCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }
}