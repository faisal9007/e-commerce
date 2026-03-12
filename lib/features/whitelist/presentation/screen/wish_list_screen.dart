import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/provider/main_nav_provider.dart';

class WishtListScreen extends StatefulWidget {
  const WishtListScreen({super.key});

  @override
  State<WishtListScreen> createState() => _WishtListScreenState();
}

class _WishtListScreenState extends State<WishtListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        context.read<MainNavProvider>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
          leading: IconButton(
              onPressed: context.read<MainNavProvider>().backToHome,
              icon: Icon(Icons.arrow_back_ios)),
        ),
      
      ),
    );
  }
}
