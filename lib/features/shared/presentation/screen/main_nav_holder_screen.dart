import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../cart/presentation/screen/cart_list_screen.dart';
import '../../../category/presentation/screen/category_list_screen.dart';
import '../../../wish-list/presentation/screen/wish_list_screen.dart';
import '../provider/main_nav_provider.dart';
import '../../../home/presentation/screen/home_screen.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
  static const String name = '/main-nav-holder';

  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  // Each tab gets its own Navigator key so the bottom
  // nav bar stays visible when pushing ProductDetailScreen
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  // Handle Android back button — go back within the tab first
  Future<bool> _onWillPop(int currentIndex) async {
    final NavigatorState? navigator =
        _navigatorKeys[currentIndex].currentState;
    if (navigator != null && navigator.canPop()) {
      navigator.pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
      builder: (context, mainNavProvider, _) {
        return WillPopScope(
          onWillPop: () => _onWillPop(mainNavProvider.selectedIndex),
          child: Scaffold(
            body: Stack(
              children: List.generate(_screens.length, (index) {
                return Offstage(
                  offstage: mainNavProvider.selectedIndex != index,
                  child: Navigator(
                    key: _navigatorKeys[index],
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (_) => _screens[index],
                      );
                    },
                  ),
                );
              }),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColors.themeColor,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              onTap: mainNavProvider.setIndex,
              currentIndex: mainNavProvider.selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Wishlist',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}