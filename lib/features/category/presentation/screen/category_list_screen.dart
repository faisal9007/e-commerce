import 'package:e_commerce/features/shared/presentation/provider/main_nav_provider.dart';
import 'package:e_commerce/features/shared/presentation/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        context.read<MainNavProvider>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
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
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                  child: CategoryCard());
            },
          ),
        ),
      ),
    );
  }
}
