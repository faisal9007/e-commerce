import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/provider/main_nav_provider.dart';
import '../../../shared/presentation/widget/ProductsCard.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        context.read<MainNavProvider>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wish-List'),
          leading: IconButton(
            onPressed: () {
              context.read<MainNavProvider>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                  child: ProductsCard());
            },
          ),
        ),
      ),
    );
  }
}
