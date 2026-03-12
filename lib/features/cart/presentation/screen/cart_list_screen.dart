import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/provider/main_nav_provider.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
            onPressed: context.read<MainNavProvider>().backToHome,
         icon: Icon(Icons.arrow_back_ios)),
      ),

    );
  }
}
