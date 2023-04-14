import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'tabs/cart/cart.dart';
import 'tabs/hometab.dart';
import 'tabs/profiletab.dart';
import 'tabs/favouritestab.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});
  static const routeName = '/homepage';
  final List tabs = const [
    HomeTab(),
    FavouritesTab(),
    CartScreen(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favourites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart', //Rewards()
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(
                builder: (context) {
                  return tabs[index];
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
