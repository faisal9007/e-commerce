import 'package:flutter/material.dart';
import '../widgets/home_products_list.dart';
import '../widgets/home_category_list.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_carousel.dart';
import '../widgets/products_search_bar.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const .symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductsSearchBar(),
              SizedBox(height: 16),
              HomeCarousel(),
              SizedBox(height: 16),
              SectionHeader(title: 'Categories', onTapSeeAll: () {}),
              SizedBox(height: 8),
              HomeCategoryList(),
              SectionHeader(title: 'Popular', onTapSeeAll: () {}),
            HomeProductsList(),
              SizedBox(height: 16),
              SectionHeader(title: 'Special', onTapSeeAll: () {}),
              HomeProductsList(),
              SizedBox(height: 16),
              SectionHeader(title: 'New', onTapSeeAll: () {}),
              HomeProductsList(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}




