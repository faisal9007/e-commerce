import 'package:e_commerce/features/shared/presentation/provider/main_nav_provider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(
            onPressed: () {
              context.read<MainNavProvider>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
