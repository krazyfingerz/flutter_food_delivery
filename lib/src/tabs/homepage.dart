import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'favourites/favourites.dart';
import 'cart/cart.dart';
import 'profile/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);
  final List tabs = const [
    Home(),
    Favourites(),
    CartScreen(),
    Profile(),    //SignIn() page. Once Input credentials, switch to Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: CupertinoTabScaffold(
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
                    label: 'Cart',//Rewards()
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